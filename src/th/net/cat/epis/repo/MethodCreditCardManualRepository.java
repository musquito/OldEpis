package th.net.cat.epis.repo;

import java.util.List;

import org.springframework.data.repository.PagingAndSortingRepository;

import th.net.cat.epis.entity.DeductionManualEntity;
import th.net.cat.epis.entity.MethodChequeManual;
import th.net.cat.epis.entity.MethodCreditCardManual;

public interface MethodCreditCardManualRepository extends PagingAndSortingRepository<MethodCreditCardManual , Integer> {
	
	List<MethodCreditCardManual> findByMethodId(Long manualId);
}
