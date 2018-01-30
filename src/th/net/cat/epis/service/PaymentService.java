package th.net.cat.epis.service;

import static java.util.Locale.ENGLISH;
import static org.apache.commons.lang.StringUtils.leftPad;

import java.math.BigDecimal;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.commons.lang.time.FastDateFormat;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import th.net.cat.epis.controller.EpContextHolder;
import th.net.cat.epis.dto.OfflineDTO;
import th.net.cat.epis.dto.ReceiptOffline;
import th.net.cat.epis.dto.SettlePaymentDTO;
import th.net.cat.epis.dto.SettlePaymentDTO.DeductTax;
import th.net.cat.epis.entity.DeductionManualEntity;
import th.net.cat.epis.entity.Document;
import th.net.cat.epis.entity.ManualEntity;
import th.net.cat.epis.entity.MasterReceiptHeaderMapping;
import th.net.cat.epis.entity.MethodChequeManual;
import th.net.cat.epis.entity.MethodCreditCardManual;
import th.net.cat.epis.entity.PayInvoiceManualEntity;
import th.net.cat.epis.entity.Receipt;
import th.net.cat.epis.entity.TrsMethodManualEntity;
import th.net.cat.epis.repo.DeductionManualRepository;
import th.net.cat.epis.repo.DocumentRepository;
import th.net.cat.epis.repo.ManualRepository;
import th.net.cat.epis.repo.MasterReceiptHeaderMappingRepository;
import th.net.cat.epis.repo.MethodChequeManualRepository;
import th.net.cat.epis.repo.MethodCreditCardManualRepository;
import th.net.cat.epis.repo.PayInvoiceManualRepository;
import th.net.cat.epis.repo.TrsMethodManualRepository;
import th.net.cat.epis.util.DateUtil;

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
	@Autowired
	MethodChequeManualRepository methodChequeManualRepository;
	@Autowired
	MethodCreditCardManualRepository methodCreditCardManualRepository;
	@Transactional
	public ReceiptOffline createPaymentService(OfflineDTO paymentDTO) throws Exception {
		logger.debug("createPaymentService");
	     String userLogin = EpContextHolder.getContext().getUserName();
		ManualEntity manualEntity = new ManualEntity();
        Date receiptDttm = new Date();
        ReceiptOffline result = new ReceiptOffline();
		PayInvoiceManualEntity invoiceManualEntity = new PayInvoiceManualEntity();
		
		List<DeductionManualEntity> dmelist = new ArrayList<DeductionManualEntity>();
		List<MethodCreditCardManual> mcclist = new ArrayList<MethodCreditCardManual>();
		List<MethodChequeManual> mcList = new ArrayList<MethodChequeManual>();
		List<TrsMethodManualEntity> metList = new ArrayList<TrsMethodManualEntity>();
		
		manualEntity.setInvoiceNo(paymentDTO.getInputInvoiceNo());
		manualEntity.setReceiptNoManual(getReceiptNo(posNO, "F", receiptDttm, "EPF"));
		manualEntity.setPaidDate(receiptDttm);
		manualEntity.setBranchArea(BA);
		manualEntity.setBranchCode(BP);
		manualEntity.setAccountNo(paymentDTO.getInputBa());
		manualEntity.setPaidAmount(paymentDTO.getInputTotalAmount());
		manualEntity.setSource("IBASS");
		manualEntity.setClearing("Y");
		manualEntity.setCreateBy(userLogin);
		manualEntity.setCreateDate( new Date());
		manualEntity.setUpdateBy(userLogin);
		manualEntity.setUpdateDate( new Date());
		manualEntity.setRecordStatus("A");
		manualRepository.save(manualEntity);
		invoiceManualEntity.setSource("IBASS");
		invoiceManualEntity.setInvoiceNo(paymentDTO.getInputInvoiceNo());
		invoiceManualEntity.setAmount(paymentDTO.getInputTotalAmount());
		invoiceManualEntity.setManualId(manualEntity.getManualId());
		invoiceManualEntity.setBeforVat(paymentDTO.getInputBeforVat());
		invoiceManualEntity.setVatAmount(paymentDTO.getInputVatAmount());
		invoiceManualEntity.setVatRate(paymentDTO.getVatRate());
		invoiceManualEntity.setCusName(paymentDTO.getInputCusName());
		invoiceManualEntity.setCusAddress(paymentDTO.getInputAddress());
		invoiceManualEntity.setCusSegment(paymentDTO.getInputCustomerSegment());
		invoiceManualEntity.setCusBranch(paymentDTO.getInputBranch());
		invoiceManualEntity.setSubNo(paymentDTO.getInputSubNo());
		invoiceManualEntity.setTaxNo(paymentDTO.getInputTaxNo());
		invoiceManualEntity.setClearing("Y");
		invoiceManualEntity.setPrintReceipt("Y");
		invoiceManualEntity.setCreateBy(userLogin);
		invoiceManualEntity.setCreateDate( new Timestamp(new Date().getTime()));
		invoiceManualEntity.setUpdateBy(userLogin);
		invoiceManualEntity.setUpdateDate( new Timestamp(new Date().getTime()));
		invoiceManualEntity.setRecordStatus("A");
		String period = DateUtil.getDisplay(paymentDTO.getInputBillCycleFrom(), DateUtil.YYYYMMDD_DATE_PATTERN, DateUtil.ENG_LOCALE)+DateUtil.getDisplay(paymentDTO.getInputBillCycleFrom(), DateUtil.YYYYMMDD_DATE_PATTERN, DateUtil.ENG_LOCALE);
		invoiceManualEntity.setPeriod(period);
		payInvoiceManualRepository.save(invoiceManualEntity);
		for(SettlePaymentDTO.Method inputMethod : paymentDTO.getMethods()){
				TrsMethodManualEntity met = new TrsMethodManualEntity();
					met.setCode(inputMethod.getCode());
					met.setName(inputMethod.getName());
					met.setAmount(inputMethod.getAmount());
					met.setCreateDate(new Timestamp(receiptDttm.getTime()) );
					met.setCreateBy(userLogin);
					met.setUpdateBy(userLogin);
					met.setUpdateDate(new Timestamp(receiptDttm.getTime()));
					met.setManualId(manualEntity.getManualId());
					trsMethodManualRepository.save(met);
					metList.add(met);
					if(inputMethod.getCode().equals("CH")) {
						MethodChequeManual  mc = new MethodChequeManual();
						mc.setNo(inputMethod.getChequeNo());
						mc.setBankCode(inputMethod.getBankCode());
						mc.setBankName(inputMethod.getBankName());
						mc.setBankBrnh(inputMethod.getBankBrnh());
						mc.setAmount(inputMethod.getAmount());
						mc.setChequeDate(inputMethod.getPayChqDate());
						mc.setMethodId(met.getMethodManualId());
//						methodChequeDAO.create(mc);
						methodChequeManualRepository.save(mc);
						mcList.add(mc);
					}else if(inputMethod.getCode().equals("CR")){
						MethodCreditCardManual mcc = new MethodCreditCardManual();
						mcc.setNo(inputMethod.getCardNo());
						mcc.setType(inputMethod.getCardType());
						mcc.setBankIssuer(inputMethod.getBankName());
						mcc.setAmount(inputMethod.getAmount());
						mcc.setUpdateDttm(new Timestamp(receiptDttm.getTime()));
						mcc.setUpdateUser(userLogin);
						mcc.setMethodId(met.getMethodManualId());
//						methodCreditCardDAO.create(mcc);
						methodCreditCardManualRepository.save(mcc);
						mcclist.add(mcc);
					}
			}
		for (DeductTax dt : paymentDTO.getDeducts()) {
			DeductionManualEntity dme = new DeductionManualEntity();
			dme.setDeductionNo(dt.getWithholdingDocNo());
			dme.setDeductionType(dt.getType());
			dme.setInvoiceNo(dt.getInvoiceNo());
			dme.setAmount(dt.getAmount());
			dme.setPaymentDate(receiptDttm);
			dme.setCreateDate(new Timestamp(receiptDttm.getTime()) );
			dme.setCreateBy(userLogin);
			dme.setUpdateBy(userLogin);
			dme.setUpdateDate(new Timestamp(receiptDttm.getTime()));
			dme.setRecordStatus("A");
			deductionManualRepository.save(dme);
			dmelist.add(dme);
		}
		result.setManualEntity(manualEntity);
		result.setPayInvoiceManualEntity(invoiceManualEntity);
		result.setTrsDeductMList(dmelist);
		result.setTrsMCRCList(mcclist);
		result.setTrsMCMList(mcList);
		result.setTrsMMList(metList);
		
		return result;
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
                document = new Document();
                document.setHeader(header);
                document.setType(receiptType);
                document.setBranchArea(branchArea);
                document.setDate(currentDate);
                document.setCount(0);
            }
            document.setCount(document.getCount() + 1);
            documentRepo.save(document);
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