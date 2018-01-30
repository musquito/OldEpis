package th.net.cat.epis.repo;

import java.util.List;

import org.springframework.data.repository.PagingAndSortingRepository;

import th.net.cat.epis.entity.DeductionManualEntity;

public interface DeductionManualRepository extends PagingAndSortingRepository<DeductionManualEntity , Integer> {
	
	List<DeductionManualEntity> findByManualId(Long manualId);
}
