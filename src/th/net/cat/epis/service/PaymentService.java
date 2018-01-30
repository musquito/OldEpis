package th.net.cat.epis.service;

import static java.util.Locale.ENGLISH;
import static org.apache.commons.lang.StringUtils.leftPad;

import java.math.BigDecimal;
import java.util.Date;

import org.apache.commons.lang.time.FastDateFormat;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import th.net.cat.epis.controller.EpContextHolder;
import th.net.cat.epis.dto.OfflineDTO;
import th.net.cat.epis.dto.SettlePaymentDTO.Method;
import th.net.cat.epis.entity.DeductionManualEntity;
import th.net.cat.epis.entity.Document;
import th.net.cat.epis.entity.ManualEntity;
import th.net.cat.epis.entity.MasterReceiptHeaderMapping;
import th.net.cat.epis.entity.PayInvoiceManualEntity;
import th.net.cat.epis.entity.Receipt;
import th.net.cat.epis.entity.TrsMethodManualEntity;
import th.net.cat.epis.repo.DeductionManualRepository;
import th.net.cat.epis.repo.DocumentRepository;
import th.net.cat.epis.repo.ManualRepository;
import th.net.cat.epis.repo.MasterReceiptHeaderMappingRepository;
import th.net.cat.epis.repo.PayInvoiceManualRepository;
import th.net.cat.epis.repo.TrsMethodManualRepository;

@org.springframework.stereotype.Service
public class PaymentService {
	private static Logger logger = Logger.getLogger(PaymentService.class);
	
	String posNO = "01";
	String BA = "01";
	String BP = "01";
	
	public static final BigDecimal VAT_RATE = new BigDecimal("7");
	@Autowired
	ManualRepository manualRepository;
	@Autowired
	DeductionManualRepository deductionManualRepository;
	@Autowired
	PayInvoiceManualRepository payInvoiceManualRepository;
	@Autowired
	TrsMethodManualRepository trsMethodManualRepository;
	@Autowired
	MasterReceiptHeaderMappingRepository masterReceiptHeaderMappingRepository;
	@Autowired
	DocumentRepository  documentRepo;
	@Transactional
	public Receipt createPaymentService(OfflineDTO paymentDTO) throws Exception {
	     String userLogin = EpContextHolder.getContext().getUserName();
		ManualEntity manualEntity = new ManualEntity();
        Date receiptDttm = new Date();
		DeductionManualEntity deductionManualEntity = new DeductionManualEntity();
		TrsMethodManualEntity trsMethodManualEntity = new TrsMethodManualEntity();
		PayInvoiceManualEntity invoiceManualEntity = new PayInvoiceManualEntity();
		manualEntity.setInvoiceNo(paymentDTO.getInputInvoiceNo());
		manualEntity.setReceiptNoManual(getReceiptNo(posNO, "F", receiptDttm, "EPF"));
		manualEntity.setPaidDate(receiptDttm);
		manualEntity.setBranchArea(BA);
		manualEntity.setBranchCode(BP);
		manualEntity.setAccountNo(paymentDTO.getInputฺฺฺBa());
		//manualEntity.setPaidAmount(inv.getTotalCharge());
		manualEntity.setPaidAmount(paymentDTO.getInputTotalAmount());
		manualEntity.setSource("IBASS");
		manualEntity.setClearing("Y");
		manualEntity.setClearingSap("Y");
		manualEntity.setCreateBy(userLogin);
		manualEntity.setCreateDate( new Date());
		manualEntity.setUpdateBy(userLogin);
		manualEntity.setUpdateDate( new Date());
		manualEntity.setRecordStatus("A");
		
//			for(Method inputMethod : paymentDTO.getMethods()){
//				TrsMethodManualEntity met = new TrsMethodManualEntity();
//					met.setCode(inputMethod.getCode());
//					met.setName(inputMethod.getName());
//					met.setAmount(inputMethod.getAmount());
//					met.setChequeNo(inputMethod.getChequeno());
//					met.setUpdateDttm(inputMethod.getUpdatedttm());
//					met.setType("CASH");
				
//			}
		
		
		
		return new Receipt();
	}
	@Transactional
	public Receipt createPaymentProduct(OfflineDTO paymentDTO) {
		
		return new Receipt();
	}
	
	public String getReceiptNo(String posNo, String receiptType, Date demandDate, String header) throws Exception {
        String branchArea = EpContextHolder.getContext().getBranchArea(), currentDate = FastDateFormat
                .getInstance("yyMMdd", ENGLISH).format((demandDate != null) ? demandDate : new Date());
        MasterReceiptHeaderMapping hdto = new  MasterReceiptHeaderMapping();
         hdto =  masterReceiptHeaderMappingRepository.findReceiptHeader(header);
         if(null != hdto){
	         if(null != hdto.getId()) {
	        	 header =  hdto.getReceiptHeader();
	         }else {
	         	throw new Exception("Duplicate LogId");
	         }
         }
        synchronized (branchArea.intern()) {
            Document document = null;
            try {
                document = documentRepo.findByTypeAndBranchAreaAndDateAndHeader(receiptType, branchArea, currentDate,
                        header);
            } catch (Exception e) {

            }
            if (document == null) {
                document = documentRepo.save(new Document());
                document.setHeader(header);
                document.setType(receiptType);
                document.setBranchArea(branchArea);
                document.setDate(currentDate);
                document.setCount(0);
            }
            document.setCount(document.getCount() + 1);
            // return new StringBuilder(header).append(leftPad(branchArea, 5,
            // "0")).append(leftPad(posNo, 2,
            // "0")).append(receiptType).append(currentDate).append(leftPad(document.getCount().toString(),
            // 4, "0")).toString();//by NSD 11-01-2016
            return new StringBuilder(header).append(leftPad(branchArea, 4, "0")).append(leftPad(posNo, 2, "0"))
                    .append(receiptType).append(currentDate).append(leftPad(document.getCount().toString(), 4, "0"))
                    .toString();// by NSD 21-03-2017
        }
    }


}