package th.net.cat.epis.repo;

import java.util.List;

import org.springframework.data.repository.PagingAndSortingRepository;

import th.net.cat.epis.entity.MethodChequeManual;
import th.net.cat.epis.entity.PayInvoiceManualEntity;

public interface MethodChequeManualRepository extends PagingAndSortingRepository<MethodChequeManual , Integer> {
	
	List<MethodChequeManual> findByMethodId(Long manualId);

}
