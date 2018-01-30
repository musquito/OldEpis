package th.net.cat.epis.controller.payment;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import th.net.cat.epis.dto.CreatePaymentResultDTO;
import th.net.cat.epis.dto.CreditLimitTrans;
import th.net.cat.epis.dto.OfflineDTO;
import th.net.cat.epis.dto.SettlePaymentDTO;
import th.net.cat.epis.entity.CreditLimitTransEntity;
import th.net.cat.epis.entity.Invoice;
import th.net.cat.epis.entity.PaymentSummary;
import th.net.cat.epis.entity.Receipt;
import th.net.cat.epis.entity.Service;
import th.net.cat.epis.entity.Session;
import th.net.cat.epis.entity.Transaction;
import th.net.cat.epis.service.PaymentService;
import th.net.cat.epis.service.UserService;
import th.net.cat.epis.util.AppConstants;
import th.net.cat.epis.util.AppUtil;

@Controller
@SessionAttributes(value = { "service_key", "auth_token" })
public class PaymentController {
	
	/*@ModelAttribute("SettlePaymentDTO") 
	public SettlePaymentDTO getPaymentDTO(){
		return new SettlePaymentDTO();
	}*/
	
	private static Logger logger = Logger.getLogger(PaymentController.class);
	@Autowired
	PaymentService paymentService;
	
	/*@Autowired
	ErpService erpService;
	
	@Autowired
	OfficerRepository officerRepo;
	@Autowired
	BillProfileRepository billRepo;
	@Autowired
	CustomerProfileRepository customerRepo;
	@Autowired
	CustomerSegmentRepository customerSegmentRepo;
	@Autowired
	CustomerGroupRepository customerGroupRepo;
	@Autowired
	ReceiptRepository receiptRepo;
	@Autowired
	PaymentRepository paymentRepo;
	@Autowired
	PayMethodRepository payMethodRepo;
	@Autowired
	DeductionRepository deductRepo;
	@Autowired
	EnumRepository enumRepo;
	@Autowired
	InvoiceLockRepository invoiceLockRepository;
	@Autowired
	ExchangeRateRepository exchangeRateRepo;*/
	/*@Autowired
	th.net.cat.epis.ws.service.ESBWS_F01RetrieveInvoiceHeaderService _f01RetrieveInvoiceHeaderService;
	@Autowired
	th.net.cat.epis.ws.service.ESBWS_F02RetrieveInvoiceAccountCodeService _f02RetrieveInvoiceAccountCodeService;
	@Autowired
	th.net.cat.epis.ws.service.ESBWS_F03RetrieveInvoiceChargesService _f03RetrieveInvoiceChargesService;
	@Autowired
	th.net.cat.epis.ws.service.ESBWS_F05RetrieveServiceStatusService _f05RetrieveServiceStatusService;
	@Autowired
	th.net.cat.epis.ws.service.ESBWS_F06ReversePaymentService _f06ReversePaymentService;
	@Autowired
	th.net.cat.epis.ws.service.ESBWS_F14RetrievePaymentService _f14RetrievePaymentService;
	@Autowired
	th.net.cat.epis.ws.service.ESBWS_F08RetrieveWriteOffInvoiceService _f08RetrieveWriteOffInvoiceService;
	@Autowired
	th.net.cat.epis.ws.service.ESBWS_F11ReverseWriteOffService _f11ReverseWriteOffService;
	@Autowired
	th.net.cat.epis.ws.service.ESBWS_F13RetrievePaymentHistory _f13RetrievePaymentHistory;
	@Autowired
	th.net.cat.epis.ws.service.ESBWS_F20RetrieveSubscrService _f20RetrieveSubscrService;
	@Autowired
	CreditLimitRepository creditLimitRepository;
	@Autowired
	InvoiceRepository invoiceRepo;
	@Autowired
	CreditLimitTransRepository creditLimitTransRepository;*/
	
	/*@Autowired
	ReceiptEgpMappingRepository egpMapRepo;*/
	@Autowired
	UserService userService;

	@ResponseBody
	@RequestMapping(value = "createPaymentService.json", method = RequestMethod.POST)
	public CreatePaymentResultDTO createPaymentServiceJSON(@RequestBody OfflineDTO paymentDTO) throws Exception {
		CreatePaymentResultDTO dto = new CreatePaymentResultDTO();
		Receipt receipts = paymentService.createPaymentService(paymentDTO);
		dto.setData(receipts);
		dto.setStatusCode("0");
		return dto;
	}
	
	@ResponseBody
	@RequestMapping(value = "createPaymentProduct.json", method = RequestMethod.POST)
	@Transactional
	public CreatePaymentResultDTO createPaymentProductJSON(@RequestBody OfflineDTO paymentDTO) throws Exception {
	
	
		return null;
	}

}