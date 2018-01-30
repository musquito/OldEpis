package th.net.cat.epis.repo;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import th.net.cat.epis.entity.MasterReceiptHeaderMapping;

public interface MasterReceiptHeaderMappingRepository extends CrudRepository<MasterReceiptHeaderMapping, Long>{
	
	
	@Query(value="select h from MasterReceiptHeaderMapping h WHERE h.ReceiptHeaderMapping = :headerMap and h.recordStatus = 'A'")
	MasterReceiptHeaderMapping findReceiptHeader(@Param("headerMap") String headerMap);

}
