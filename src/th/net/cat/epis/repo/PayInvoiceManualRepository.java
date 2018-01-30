package th.net.cat.epis.repo;

import org.springframework.data.repository.PagingAndSortingRepository;

import th.net.cat.epis.entity.PayInvoiceManualEntity;

public interface PayInvoiceManualRepository extends PagingAndSortingRepository<PayInvoiceManualEntity, Long> {
	PayInvoiceManualEntity findByManualId(Long manual_id);
}
