package th.net.cat.epis.controller.report;

import static java.util.Locale.ENGLISH;
import static org.apache.commons.lang.StringUtils.stripToEmpty;
import static th.net.cat.epis.util.AppConstants.FILE_TYPE_JRXML;
import static th.net.cat.epis.util.AppConstants.JASPER_JRXML_PATH;
import static th.net.cat.epis.util.AppConstants.RECEIPT_ACCOUNT_TYPE_CODE_GOVERNMENT;
import static th.net.cat.epis.util.AppConstants.RECEIPT_ACCOUNT_TYPE_CODE_INDIVIDUAL;
import static th.net.cat.epis.util.AppConstants.RECEIPT_ACCOUNT_TYPE_CODE_ORGANIZATION;
import static th.net.cat.epis.util.AppConstants.TAX_CODE_NONVAT;
import static th.net.cat.epis.util.AppConstants.*;

import java.io.File;
import java.math.BigDecimal;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Controller;
import org.springframework.util.CollectionUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.context.ServletContextAware;

import net.sf.jasperreports.engine.JRDataSource;
import net.sf.jasperreports.engine.JREmptyDataSource;
import net.sf.jasperreports.engine.JasperCompileManager;
import net.sf.jasperreports.engine.JasperExportManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.data.JRBeanCollectionDataSource;
import th.net.cat.epis.dto.PrintReceiptDTO;
import th.net.cat.epis.dto.SettlePaymentDTO;
import th.net.cat.epis.dto.SettlePaymentDTO.Customer;
import th.net.cat.epis.dto.SettlePaymentDTO.Invoice;
import th.net.cat.epis.dto.SettlePaymentDTO.InvoiceVatDetail;
import th.net.cat.epis.entity.Receipt;
import th.net.cat.epis.entity.ReceiptEgpMappingEntity;
import th.net.cat.epis.entity.Service;
import th.net.cat.epis.to.report.CustomerTaxReceiptForOthersPaymentTO;
import th.net.cat.epis.to.report.CustomerTaxReceiptTO;
import th.net.cat.epis.util.AppConstants;
import th.net.cat.epis.util.AppConstants.RECEIPT_PRINT_TYPES;
import th.net.cat.epis.util.AppUtil;
import th.net.cat.epis.util.DateUtil;


@Controller
//@SessionAttributes(value={ AppConstants.DAILY_PAYMENT_DEDUCT_REPORT_KEY })
public class PDFController implements ServletContextAware {
	private static Logger logger = Logger.getLogger(PDFController.class);
	/*@Autowired ReceiptRepository receiptRepo;
	@Autowired TransactionRepository transactionRepo;
	@Autowired MoneyTransferRepository moneyTransferRepo;
	@Autowired InvoiceRepository invoiceRepo;
	@Autowired ServiceRepository serviceRepo;
	@Autowired OfficerRepository officerRepo;
	@Autowired ReceiptPrintTypeMappingRepository receiptPrintTypeMappingRepo;
	@Autowired EnumRepository enumRepo;
	@Autowired EpisService episService;
	@Autowired ReceiptEgpMappingRepository egpMapRepo;
    @Autowired ReceiptPrintTypeMappingRepository rctPrintTypeMapRepo;
	@Autowired AgentRepository agentRepository;
	@Autowired
	EndDayClosingService endDayClosingService;
	@Autowired
	OTBOssService otbossservice;
	@Resource(name="episJdbcTemplate")
	JdbcTemplate episJdbcTemplate;*/
	@Autowired
	protected MessageSource messages;
	
	/*@Autowired 
	private ReportController reportController;*/
	@Autowired
	ServletContext context;
	private final String TOPUP = "TOPUP";
	private final String MNP = "MNP";
	private final String AGENT = "AGENT";
	List<ReceiptEgpMappingEntity> egpMapFind = null;
	BigDecimal AmountBeforeVatTH, summaryAmountBeforeVatTH, summaryDiscountTH, summaryAmountSumBeforeVatTH, summaryAmountSumAfterVatTH,amountPaid, summaryVatTH, additionalDiscountAfterVatTH, AmountSumAfterVatTH = BigDecimal.ZERO;


    //private void pushReportToOutputStream(HttpServletResponse response, List<JasperPrint> jasperPrints) throws IOException, JRException  {
    private void pushReportToOutputStream(HttpServletResponse resp,Map<String, Object> parameters ,String fileName ){//HttpServletResponse response, List<JasperPrint> jasperPrints) throws IOException, JRException  {   
    	try{
    		JasperReport jreport = JasperCompileManager.compileReport(fileName);
    		JasperPrint jasperPrint = JasperFillManager.fillReport(jreport, parameters, new JREmptyDataSource());
    		resp.setContentType("application/octet-stream");
            resp.setHeader("Content-Disposition", String.format("inline; filename=\"report.pdf\""));
            resp.setHeader("Set-Cookie", "fileDownload=true; path=/");
            resp.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
            JasperExportManager.exportReportToPdfStream(jasperPrint, resp.getOutputStream());
    		    
    	}catch(Exception e){
    		e.printStackTrace();
    	}
	      
    }
    @RequestMapping(value="/printPaymentReceipt.pdf", method={RequestMethod.POST,RequestMethod.GET})
	public void printPaymentReceipt(HttpServletRequest request, HttpServletResponse response, PrintReceiptDTO printReceiptDTO, List<Invoice> invoiceList
			) throws Exception {
		String receiptLang = printReceiptDTO.getReceiptLang();
		String billingGroup = printReceiptDTO.getBillingGroup();
		String receiptFormat = printReceiptDTO.getReceiptFormat();
		String note = printReceiptDTO.getNote();

		boolean isSubstitute = (printReceiptDTO.getSubstitute()!=null)?Boolean.valueOf(printReceiptDTO.getSubstitute()):false;
		
		String JASPER_JRXML_FILENAME = "EpisPaymentReceipt";//(printReceiptDTO, invoiceList);
	
		Map<String, Object> parameters = new HashMap<String, Object>();
		/*Officer officer = null;
		if(AppUtil.isCollectionHasValue(printReceiptDTO.getReceipts())) {
			officer = officerRepo.findByName(request.getUserPrincipal().getName());
		}*/
		List<JasperPrint> jasperPrints = new ArrayList<JasperPrint>();
	
		CustomerTaxReceiptTO obj = new CustomerTaxReceiptTO();
		Customer cust = printReceiptDTO.getSettlePaymentDTO().getCustomers().get(0);
		obj.setBillingGroup(cust.getBillGroup());//
		obj.setCustomerSubNo(cust.getCustSubNo());
		obj.setBranchName(cust.getCustBranch());
		obj.setBranchCode(cust.getCustBranch());
		obj.setCustomerNo(cust.getCustNo());
		obj.setAddressLine1(cust.getAddress1());
		String paymentCase ="";
		//for(Invoice invoice : cust.getInvoices()){
		for (SettlePaymentDTO.Invoice inv2 : cust.getInvoices() ) {
			
			//if (receipt.getId() == invoice.getReceiptId()) {
				if (inv2.getPaymentCase() != null && inv2.getPaymentCase().indexOf("+") > 0) {
					String paymentCaseArr[] = inv2.getPaymentCase().split("\\+");
					for (int i = 0; i < paymentCaseArr.length; i++) {
						if (paymentCaseArr[paymentCaseArr.length - 1].length() <= 1) { 
							paymentCase = inv2.getPaymentCase().substring(0,inv2.getPaymentCase().length() - 3);
						} else {
							paymentCase = inv2.getPaymentCase();
						}
					}
				//	receipt.setPaymentCase(paymentCase);
				} else {
				//	receipt.setPaymentCase(inv2.getPaymentCase());
					paymentCase = inv2.getPaymentCase();
				}
			//}
		}
        

		obj.setTaxId(cust.getTaxNo());
		obj.setPaymentType(paymentCase);
		String offsetDocumentNo ="";
		//obj.setOffsetDocumentNo(offsetDocumentNo);
		for (SettlePaymentDTO.Method met : printReceiptDTO.getSettlePaymentDTO().getMethods()) {//offsetdocNo
			if (met != null && met.getType() != null) {
				 if (PAY_METHOD_OFFSET.equals(met.getType())) {
					 offsetDocumentNo = met.getOffsetDocumentNo();
					
				} 
				
			}
		}
		obj.setOffsetDocumentNo(offsetDocumentNo);
		//obj.setBranchPayment(cust.getCustBranch());
		obj.setEgpContract(cust.getEgpContract());
		obj.setEgpNo(cust.getEgpNo());
		/*egpMap = new ReceiptEgpMappingEntity();
		egpMap.setReceiptId(rec.getId());
		egpMap.setCreatedBy(SecurityContextHolder.getContext().getAuthentication().getName());
		egpMap.setCreatedDate(timestamp);
		egpMap.setBaNo(cust.getCustNo());
		egpMap.setEgpNo(cust.getEgpNo());
		egpMap.setEgpContract(cust.getEgpContract());
		egpMap.setReceiptNo(rec.getNo());
		egpMaps.add(egpMap);
		egpMapRepo.save(egpMap);*/
		Date date = new Date();
		//receipt.setUpdateDttm(date);
	/*	
		customer.setType(cust.getCustType());
		customer.setNo(cust.getCustNo());
		customer.setName(cust.getCustName());
		customer.setTax(cust.getTaxNo());
		customer.setBillGroup(cust.getBillGroup());
		customer.setCollectionUnit(cust.getCollectionUnit());
		customer.setOutstanding(cust.getOutstanding());
		customer.setRemark(cust.getRemark());
		customer.setReceiptAddr(cust.getAddress1());
		customer.setInvoiceAddr(cust.getAddress2());
		customer.setAcctCatLkp(cust.getAcctCatLkp());// by NSD 02-03-2017
		customer.setCatCustomerSegment(cust.getCatCustomerSegment());*/
		
		
		/*
		 * $P{ReportSource}.getBillingGroup()
		$P{ReportSource}.getCustomerSubNo()
		$P{ReportSource}.getBranchName()
		$P{ReportSource}.getCustomerName()
		$P{ReportSource}.getDocumentNo()
		$P{ReportSource}.getAddressLine1()
		$P{ReportSource}.getDocumentDate()
		$P{ReportSource}.getTaxId()
		null!=$P{ReportSource}.getBranchPayment()?!"00000".equalsIgnoreCase($P{ReportSource}.getBranchPayment())?" "+$P{ReportSource}.getBranchPayment():"":""

		$P{ReportSource}.getPaymentType().equalsIgnoreCase("offset")?($P{ReportSource}.getPaymentType()+""+$P{ReportSource}.getOffsetDocumentNo()):$P{ReportSource}.getPaymentType()

		$P{ReportSource}.getEgpContract()
		$P{ReportSource}.getEgpNo()

		$F{orderNo}
		$F{invoiceNo}
		$F{paymentCycle}
		$F{amountBeforeVat}
		$F{discount}
		$F{amountSumBeforeVat}
		$F{vat}
		$F{amountSumAfterVat}


		$P{ReportSource}.getPromotionTxt()
		$P{ReportSource}.getNoteTxt()

		" "+$P{ReportSource}.getReasonOfSubstitute()
		new SimpleDateFormat("dd/MM/yyyy HH:mm").format(new Date().getTime())

		ช่องรวมเงิน
		$P{ReportSource}.getSummaryAmountBeforeVat()
		$P{ReportSource}.getSummaryDiscount()
		$P{ReportSource}.getSummaryAmountSumBeforeVat()
		$P{ReportSource}.getSummaryVat()
		$P{ReportSource}.getSummaryAmountSumAfterVat()
		$P{ReportSource}.getAdditionalDiscountAfterVat()
		$P{ReportSource}.getAmountPaid()


		ลงชื่อ
		"(" +$P{ReportSource}.getUserName()+ ")"*/
		parameters.put("ReportSource", obj);
		
		List<CustomerTaxReceiptTO> collections = new ArrayList<CustomerTaxReceiptTO>();
		net.sf.jasperreports.engine.JasperReport report = JasperCompileManager.compileReport(context.getRealPath(JASPER_JRXML_PATH) + File.separatorChar + JASPER_JRXML_FILENAME + FILE_TYPE_JRXML);
		JRDataSource dataSource = (collections != null && !collections.isEmpty()) ? new JRBeanCollectionDataSource(collections) : new JREmptyDataSource();
        jasperPrints.add(JasperFillManager.fillReport(report, parameters, dataSource));
		pushReportToOutputStream(response, parameters,context.getRealPath(JASPER_JRXML_PATH) + File.separatorChar + JASPER_JRXML_FILENAME + FILE_TYPE_JRXML);
	}

    private String getJasperFileName(PrintReceiptDTO printReceiptDTO, List<Invoice> invoiceList){
		String receiptLang = printReceiptDTO.getReceiptLang();
		String dfCurrencyCode = "12"; //default code 12 = TH
		String currencyCode = "12"; //
		
		String JASPER_JRXML_FILENAME = "EpisPaymentReceipt";//"";
        //String JASPER_JRXML_FILENAME = "EpisPaymentReceipt";//"";
	//	 String JASPER_JRXML_FILENAME = "EpisPaymentReceipt2";//"";
        
        if (printReceiptDTO.getCustomers().size()>0) {
        	if (printReceiptDTO.getCustomers().get(0).getInvoices().size()>0) {
        		currencyCode = null!=printReceiptDTO.getCustomers().get(0).getInvoices().get(0).getCurrencyCode()?
        								!printReceiptDTO.getCustomers().get(0).getInvoices().get(0).getCurrencyCode().equalsIgnoreCase("")?
        										printReceiptDTO.getCustomers().get(0).getInvoices().get(0).getCurrencyCode():dfCurrencyCode:dfCurrencyCode;
        	}
        } else if(invoiceList!=null){
        	if (invoiceList.size()>0) {
				currencyCode = null!=invoiceList.get(0).getCurrencyCode()?
						!invoiceList.get(0).getCurrencyCode().equalsIgnoreCase("")?
								invoiceList.get(0).getCurrencyCode():dfCurrencyCode:dfCurrencyCode;
			}

		}
		if (!"12".equalsIgnoreCase(currencyCode) && printReceiptDTO.isCopy()) {
			JASPER_JRXML_FILENAME="EpisPaymentReceipt_CopyCurrency";
		} 
		if (!"12".equalsIgnoreCase(currencyCode) && !printReceiptDTO.isCopy()) {
			JASPER_JRXML_FILENAME="EpisPaymentReceipt_Currency";
		} 
		if ("12".equalsIgnoreCase(currencyCode) && printReceiptDTO.isCopy()) {
			JASPER_JRXML_FILENAME="EpisPaymentCopyReceipt";
		}
//		if(printReceiptDTO.isCopy())
//			JASPER_JRXML_FILENAME="EpisPaymentCopyReceipt";
		if(!StringUtils.isEmpty(receiptLang) && receiptLang.equals(AppConstants.LANGUAGE_KEY.ENG.name()))
			 JASPER_JRXML_FILENAME = JASPER_JRXML_FILENAME+"ENG";
		return JASPER_JRXML_FILENAME;
	}
    
    private void prepareCustomerTaxReceiptTO(List<CustomerTaxReceiptTO> collections, Receipt receipt, PrintReceiptDTO printReceiptDTO/* List<Customer> listCust*/) throws CloneNotSupportedException {
    /*private void prepareCustomerTaxReceiptTO(List<CustomerTaxReceiptTO> collections, Receipt receipt, PrintReceiptDTO printReceiptDTO List<Customer> listCust) throws CloneNotSupportedException {
    		Receipt rct = receiptRepo.findOne(receipt.getId());*/
		Receipt rct = new Receipt();//receiptRepo.findOne(receipt.getId());
		// Fix By EPIS8 29/12/2016 issue no 57
		rct.setPaymentCase("test");
		/*start mockup*/
		String maskCC = AppUtil.maskCreditCardFromString(rct.getPaymentCase(), "************####");
		String paymentCase = AppUtil.hideWTNumber(maskCC);
		rct.setPaymentCase(paymentCase);
		// End Fix By EPIS8 29/12/2016 issue no 57
		DecimalFormat df = new DecimalFormat();
		df.setMaximumFractionDigits(2);
		df.setMinimumFractionDigits(2);
		df.setMinimumIntegerDigits(1);
		CustomerTaxReceiptTO customer = new CustomerTaxReceiptTO();
		CustomerTaxReceiptTO customerInv = null;

		//printReceiptDTO.getSettlePaymentDTO().getCustomers()
		//if(printReceiptDTO.getCustomers()!=null && printReceiptDTO.getCustomers().size()!=0){
	//	if(printReceiptDTO.getCustomers()!=null && printReceiptDTO.getCustomers().size()!=0){
		//	for (Customer cust : printReceiptDTO.getCustomers()) {
		//for (Customer cust : printReceiptDTO.getCustomers()) {
		if(printReceiptDTO.getSettlePaymentDTO().getCustomers()!=null && printReceiptDTO.getSettlePaymentDTO().getCustomers().size()!=0){
			for (Customer cust : printReceiptDTO.getSettlePaymentDTO().getCustomers()) {
			    if (null!=cust.getCustNo()) {
                  // if(cust.getCustNo().equalsIgnoreCase(rct.getAccountNo())){
			    	BeanUtils.copyProperties(cust, customer);
                        //Header Information
                      /*  customer.setReceiptType(rct.getType());
                        //Customer Information
                        customer.setCustomerNo(rct.getAccountNo());
                        customer.setCustomerSubNo(rct.getAccountSubNo());
                        customer.setCustomerName(rct.getName());
                        customer.setAddressLine1(rct.getAddrLine1());
                        customer.setAddressLine2(rct.getAddrLine2());
                        customer.setTaxId(rct.getTaxNo());
                        customer.setPaymentType(rct.getPaymentCase());
                        customer.setBranchPayment(rct.getAccountBranch());

                        customer.setBranchCode(rct.getBranchCode());
                        customer.setBranchName(calculateBranchName(rct));
                        customer.setDocumentNo(rct.getNo());
                        customer.setDocumentDate(new SimpleDateFormat(DateUtil.STANDARD_DATE_TIME_PATTERN_NO_SECONDS, ENGLISH).format(rct.getDocDttm()));//rct.getPayment().getDate().toString()); // format properly
                        customer.setCustomerType(calculateCustomerTypeCode(rct.getAccountType()));

                        customer.setEgpNo(cust.getEgpNo());
                        customer.setEgpContract(cust.getEgpContract());
*/
                        //Additional Information
                        customer.setNoteTxt(cust.getRemark());//rct.getRemark());
                        //customer.setPromotionTxt(rct.getPromotion());
                        customer.setPromotionTxt(getPromotionMessage(rct));
                        //change billing group to other description by NSD
                       // customer.setBillingGroup(rct.getBillingServiceName());

                        //Summary Information
                        BigDecimal afterSaleDiscount = new BigDecimal(0);
                        BigDecimal afterSaleDiscVat = new BigDecimal(0);
                        for(Invoice invoice : cust.getInvoices()){
                        	customer.setSummaryAmountBeforeVat(df.format(invoice.getCharge().add(invoice.getDiscount()))); // format
                            customer.setSummaryDiscount(df.format(invoice.getDiscount()));
                            customer.setSummaryAmountSumBeforeVat(df.format(invoice.getCharge()));
                            customer.setSummaryVat(df.format(invoice.getVat()));
                             afterSaleDiscount = (invoice.getAfterSaleDiscount()!=null)?invoice.getAfterSaleDiscount():BigDecimal.ZERO;
        					 afterSaleDiscVat = (invoice.getAfterSaleDiscVat()!=null)?invoice.getAfterSaleDiscVat():BigDecimal.ZERO;
        					//customer.setSummaryAmountSumAfterVat(df.format(rct.getTotalCharge().subtract(afterSaleDiscount).subtract(afterSaleDiscVat)));//by NSD 05-04-2017
        					customer.setSummaryAmountSumAfterVat(df.format(rct.getTotalCharge()));//by NSD 28-04-2017
        					customer.setAdditionalDiscountAfterVat(df.format(afterSaleDiscount));
        					//customer.setAmountPaid(df.format(rct.getTotalCharge().subtract(afterSaleDiscount)));
        					customer.setAmountPaid(df.format(rct.getTotalCharge().subtract(afterSaleDiscount).subtract(afterSaleDiscVat)));
                        }
                        /*customer.setSummaryAmountBeforeVat(df.format(rct.getCharge().add(rct.getDiscount()))); // format
                        customer.setSummaryDiscount(df.format(rct.getDiscount()));
                        customer.setSummaryAmountSumBeforeVat(df.format(rct.getCharge()));
                        customer.setSummaryVat(df.format(rct.getVat()));*/
                        //customer.setSummaryAmountSumAfterVat(df.format(rct.getTotalCharge().subtract(rct.getAfterSaleDiscount())));

					/*BigDecimal afterSaleDiscount = (rct.getAfterSaleDiscount()!=null)?rct.getAfterSaleDiscount():BigDecimal.ZERO;
					BigDecimal afterSaleDiscVat = (rct.getAfterSaleDiscVat()!=null)?rct.getAfterSaleDiscVat():BigDecimal.ZERO;
					//customer.setSummaryAmountSumAfterVat(df.format(rct.getTotalCharge().subtract(afterSaleDiscount).subtract(afterSaleDiscVat)));//by NSD 05-04-2017
					customer.setSummaryAmountSumAfterVat(df.format(rct.getTotalCharge()));//by NSD 28-04-2017
					customer.setAdditionalDiscountAfterVat(df.format(afterSaleDiscount));
					//customer.setAmountPaid(df.format(rct.getTotalCharge().subtract(afterSaleDiscount)));
					customer.setAmountPaid(df.format(rct.getTotalCharge().subtract(afterSaleDiscount).subtract(afterSaleDiscVat)));*/

                        //Detail
                        int i = 1;
                        List<Invoice> invoices = new ArrayList<Invoice>();//invoiceRepo.findByReceiptId(rct.getId());
                        for(Invoice inv : invoices) {
                            if(!CollectionUtils.isEmpty(inv.getInvoiceVatDetails()) && inv.getInvoiceVatDetails().size()>1){
                                for(InvoiceVatDetail dtl: inv.getInvoiceVatDetails()){
                                    customerInv = (CustomerTaxReceiptTO) customer.clone();
                                    customerInv.setOrderNo(String.valueOf(i++));
                                    customerInv.setInvoiceNo(!inv.getNo().equals("0")? inv.getNo():"-");
                                    customerInv.setPaymentCycle(!StringUtils.isEmpty(inv.getBillCycle())? inv.getBillCycle(): "-");

                                    customerInv.setAmountBeforeVat(df.format(dtl.getAmount()));
                                    customerInv.setDiscount(df.format(inv.getDiscount()));//wait for asking
                                    customerInv.setAmountSumBeforeVat(df.format(dtl.getAmount()));
                                    if(null!=dtl.getVat() && !StringUtils.equals(dtl.getTaxTypeCode(), TAX_CODE_NONVAT)){
                                        customerInv.setVat(df.format(dtl.getVat()));
                                    }else{
                                        customerInv.setVat("-");
                                    }
                                    customerInv.setAmountSumAfterVat(df.format(dtl.getAmount().add(dtl.getVat())));

                                    customerInv.setReceiptType(rct.getType());
                                    customerInv.setCurrencyRate(rct.getPayment().getCurrencyRate());
                                    if (null!=customerInv.getCurrencyRate()) {
                                        AmountBeforeVatTH = inv.getCharge().add(inv.getDiscount());
                                        AmountBeforeVatTH = AmountBeforeVatTH.multiply(customerInv.getCurrencyRate());
                                        customerInv.setAmountBeforeVatTH(AmountBeforeVatTH);
                                        customerInv.setVatRate(rct.getVatRate());

                                        AmountSumAfterVatTH = (inv.getCharge().add(inv.getDiscount())).add(inv.getVat());
                                        AmountSumAfterVatTH = AmountSumAfterVatTH.multiply(customerInv.getCurrencyRate());
                                        customerInv.setAmountSumAfterVatTH(AmountSumAfterVatTH);
                                    }
                                    collections.add(customerInv);
                                }
                            }else{
                                customerInv = (CustomerTaxReceiptTO) customer.clone();
                                customerInv.setOrderNo(String.valueOf(i++));
                                customerInv.setInvoiceNo(!inv.getNo().equals("0")? inv.getNo():"-");
                                
                                customerInv.setPaymentCycle(!StringUtils.isEmpty(inv.getBillCycle())? inv.getBillCycle(): "-");

                                customerInv.setAmountBeforeVat(df.format(inv.getCharge().add(inv.getDiscount())));
                                customerInv.setDiscount(df.format(inv.getDiscount()));
                                customerInv.setAmountSumBeforeVat(df.format(inv.getCharge()));
                                if(null!=inv.getVat()){
                                    customerInv.setVat(df.format(inv.getVat()));
                                }else{
                                    customerInv.setVat("-");
                                }
                                customerInv.setAmountSumAfterVat(df.format(inv.getTotalCharge()));


                                customerInv.setReceiptType(rct.getType());
                                customerInv.setCurrencyRate(rct.getPayment().getCurrencyRate());
                                if (null!=customerInv.getCurrencyRate()) {
                                    AmountBeforeVatTH = inv.getCharge().add(inv.getDiscount());
                                    AmountBeforeVatTH = AmountBeforeVatTH.multiply(customerInv.getCurrencyRate());
                                    customerInv.setAmountBeforeVatTH(AmountBeforeVatTH);
                                    customerInv.setVatRate(rct.getVatRate());

                                    AmountSumAfterVatTH = (inv.getCharge().add(inv.getDiscount())).add(inv.getVat());
                                    AmountSumAfterVatTH = AmountSumAfterVatTH.multiply(customerInv.getCurrencyRate());
                                    customerInv.setAmountSumAfterVatTH(AmountSumAfterVatTH);
                                }
                                collections.add(customerInv);
                            }
                        }
                 //   }
                } else {
                    egpMapFind = new ArrayList<ReceiptEgpMappingEntity>();//egpMapRepo.findByReceiptNo(rct.getNo());//W3P 28-FEB-2017 set egpNo and egpContract

                    //Header Information
                    customer.setReceiptType(rct.getType());
                    //Customer Information
                    customer.setCustomerNo(rct.getAccountNo());
                    customer.setCustomerSubNo(rct.getAccountSubNo());
                    customer.setCustomerName(rct.getName());
                    customer.setAddressLine1(rct.getAddrLine1());
                    customer.setAddressLine2(rct.getAddrLine2());
                    customer.setTaxId(rct.getTaxNo());
                    customer.setPaymentType(rct.getPaymentCase());
                    customer.setBranchPayment(rct.getAccountBranch());

                    customer.setBranchCode(rct.getBranchCode());
                    customer.setBranchName(calculateBranchName(rct));
                    customer.setDocumentNo(rct.getNo());
                    customer.setDocumentDate(new SimpleDateFormat(DateUtil.STANDARD_DATE_TIME_PATTERN_NO_SECONDS, ENGLISH).format(rct.getDocDttm()));//rct.getPayment().getDate().toString()); // format properly
                    customer.setCustomerType(calculateCustomerTypeCode(rct.getAccountType()));


                    customer.setEgpNo(cust.getEgpNo()!=null?cust.getEgpNo():egpMapFind.size()>0?null!=egpMapFind.get(0).getEgpNo()?!egpMapFind.get(0).getEgpNo().equalsIgnoreCase("")?egpMapFind.get(0).getEgpNo():"":"":"");
                    customer.setEgpContract(cust.getEgpContract()!=null?cust.getEgpContract():egpMapFind.size()>0?null!=egpMapFind.get(0).getEgpContract()?!egpMapFind.get(0).getEgpContract().equalsIgnoreCase("")?egpMapFind.get(0).getEgpContract():"":"":"");

                    //Additional Information
                    customer.setNoteTxt(rct.getRemark());
                    //customer.setPromotionTxt(rct.getPromotion());
                    customer.setPromotionTxt(getPromotionMessage(rct));

                    //Summary Information
                    customer.setSummaryAmountBeforeVat(df.format(rct.getCharge().add(rct.getDiscount()))); // format
                    customer.setSummaryDiscount(df.format(rct.getDiscount()));
                    customer.setSummaryAmountSumBeforeVat(df.format(rct.getCharge()));
                    customer.setSummaryVat(df.format(rct.getVat()));
                    //customer.setSummaryAmountSumAfterVat(df.format(rct.getTotalCharge().subtract(rct.getAfterSaleDiscount())));
                    BigDecimal afterSaleDiscount = (rct.getAfterSaleDiscount()!=null)?rct.getAfterSaleDiscount():BigDecimal.ZERO;
                    BigDecimal afterSaleDiscVat = (rct.getAfterSaleDiscVat()!=null)?rct.getAfterSaleDiscVat():BigDecimal.ZERO;

                    customer.setSummaryAmountSumAfterVat(df.format(rct.getTotalCharge().subtract(afterSaleDiscount).subtract(afterSaleDiscVat)));//by NSD 05-04-2017
                    customer.setAdditionalDiscountAfterVat(df.format(afterSaleDiscount));
                    customer.setAmountPaid(df.format(rct.getTotalCharge().subtract(afterSaleDiscount)));

                    customer.setBillingGroup(rct.getBillingServiceName());

                    //get receipt format
                    String titleReceiptName = "RECEIVE_WH";
                    if (rct.getFlgHeader()!=null && rct.getLanguage()!=null) {
                        titleReceiptName = "test";//getReceiptName(rct.getFlgHeader(),rct.getLanguage());
                    } else {
						titleReceiptName = "test";//episService.getReceiptNameByreceiptId(rct.getId().toString());
                    }

                    customer.setReceiptFormat(titleReceiptName);

                    //Detail
                    int i = 1;
                    List<Invoice> invoices = new ArrayList<Invoice>();//invoiceRepo.findByReceiptId(rct.getId());
                    for(Invoice inv : invoices) {
                        if(!CollectionUtils.isEmpty(inv.getInvoiceVatDetails()) && inv.getInvoiceVatDetails().size()>1){
                            for(InvoiceVatDetail dtl: inv.getInvoiceVatDetails()){
                                customerInv = (CustomerTaxReceiptTO) customer.clone();
                                customerInv.setOrderNo(String.valueOf(i++));
                                customerInv.setInvoiceNo(!inv.getNo().equals("0")? inv.getNo():"-");
                                customerInv.setPaymentCycle(!StringUtils.isEmpty(inv.getBillCycle())? inv.getBillCycle(): "-");

                                customerInv.setAmountBeforeVat(df.format(dtl.getAmount()));
                                customerInv.setDiscount(df.format(inv.getDiscount()));//wait for asking
                                customerInv.setAmountSumBeforeVat(df.format(dtl.getAmount()));
                                if(null!=dtl.getVat() && !StringUtils.equals(dtl.getTaxTypeCode(), TAX_CODE_NONVAT)){
                                    customerInv.setVat(df.format(dtl.getVat()));
                                }else{
                                    customerInv.setVat("-");
                                }
                                customerInv.setAmountSumAfterVat(df.format(dtl.getAmount().add(dtl.getVat())));

                                customerInv.setReceiptType(rct.getType());
                                customerInv.setCurrencyRate(rct.getPayment().getCurrencyRate());
                                if (null!=customerInv.getCurrencyRate()) {
                                    AmountBeforeVatTH = inv.getCharge().add(inv.getDiscount());
                                    AmountBeforeVatTH = AmountBeforeVatTH.multiply(customerInv.getCurrencyRate());
                                    customerInv.setAmountBeforeVatTH(AmountBeforeVatTH);
                                    customerInv.setVatRate(rct.getVatRate());

                                    AmountSumAfterVatTH = (inv.getCharge().add(inv.getDiscount())).add(inv.getVat());
                                    AmountSumAfterVatTH = AmountSumAfterVatTH.multiply(customerInv.getCurrencyRate());
                                    customerInv.setAmountSumAfterVatTH(AmountSumAfterVatTH);
                                }
                                collections.add(customerInv);
                            }
                        }else{
                            customerInv = (CustomerTaxReceiptTO) customer.clone();
                            customerInv.setOrderNo(String.valueOf(i++));
                            customerInv.setInvoiceNo(!inv.getNo().equals("0")? inv.getNo():"-");
                            customerInv.setPaymentCycle(!StringUtils.isEmpty(inv.getBillCycle())? inv.getBillCycle(): "-");
                            customerInv.setAmountBeforeVat(df.format(inv.getCharge().add(inv.getDiscount())));
                            customerInv.setDiscount(df.format(inv.getDiscount()));
                            customerInv.setAmountSumBeforeVat(df.format(inv.getCharge()));
                            if(null != inv.getVat()){
                                customerInv.setVat(df.format(inv.getVat()));
                            }else{
                                customerInv.setVat("-");
                            }
                            customerInv.setAmountSumAfterVat(df.format(inv.getTotalCharge()));
                            customerInv.setReceiptType(rct.getType());
                            customerInv.setCurrencyRate(rct.getPayment().getCurrencyRate());
                            if (null!=customerInv.getCurrencyRate()) {
                                AmountBeforeVatTH = inv.getCharge().add(inv.getDiscount());
                                AmountBeforeVatTH=AmountBeforeVatTH.multiply(customerInv.getCurrencyRate());
                                customerInv.setAmountBeforeVatTH(AmountBeforeVatTH);
                                customerInv.setVatRate(rct.getVatRate());
                                if(null!=inv.getVat()){
                                    AmountSumAfterVatTH = (inv.getCharge().add(inv.getDiscount())).add(inv.getVat());
                                }else{
                                    AmountSumAfterVatTH = (inv.getCharge().add(inv.getDiscount()));
                                }
                                AmountSumAfterVatTH = AmountSumAfterVatTH.multiply(customerInv.getCurrencyRate());
                                customerInv.setAmountSumAfterVatTH(AmountSumAfterVatTH);
                            }

                            collections.add(customerInv);
                        }
                    }
                }
			}
		}else{
			egpMapFind = new ArrayList<ReceiptEgpMappingEntity>();// egpMapRepo.findByReceiptNo(receipt.getNo());//W3P 28-FEB-2017 set egpNo and egpContract

			//Header Information
			customer.setReceiptType(rct.getType());
			//Customer Information
			customer.setCustomerNo(rct.getAccountNo());
			customer.setCustomerSubNo(rct.getAccountSubNo());
			customer.setCustomerName(rct.getName());
			customer.setAddressLine1(rct.getAddrLine1());
			customer.setAddressLine2(rct.getAddrLine2());
			customer.setTaxId(rct.getTaxNo());
			customer.setPaymentType(rct.getPaymentCase());
			customer.setBranchPayment(rct.getAccountBranch());

			customer.setBranchCode(rct.getBranchCode());
			customer.setBranchName(calculateBranchName(rct));
			customer.setDocumentNo(rct.getNo());
			customer.setDocumentDate(new SimpleDateFormat(DateUtil.STANDARD_DATE_TIME_PATTERN_NO_SECONDS, ENGLISH).format(rct.getDocDttm()));//rct.getPayment().getDate().toString()); // format properly
			customer.setCustomerType(calculateCustomerTypeCode(rct.getAccountType()));


			customer.setEgpNo(egpMapFind.size()>0?null!=egpMapFind.get(0).getEgpNo()?!egpMapFind.get(0).getEgpNo().equalsIgnoreCase("")?egpMapFind.get(0).getEgpNo():"":"":"");
			customer.setEgpContract(egpMapFind.size()>0?null!=egpMapFind.get(0).getEgpContract()?!egpMapFind.get(0).getEgpContract().equalsIgnoreCase("")?egpMapFind.get(0).getEgpContract():"":"":"");

			//Additional Information
			customer.setNoteTxt(rct.getRemark());
			//customer.setPromotionTxt(rct.getPromotion());
			customer.setPromotionTxt(getPromotionMessage(rct));

			//Summary Information
			customer.setSummaryAmountBeforeVat(df.format(rct.getCharge().add(rct.getDiscount()))); // format
			customer.setSummaryDiscount(df.format(rct.getDiscount()));
			customer.setSummaryAmountSumBeforeVat(df.format(rct.getCharge()));
			customer.setSummaryVat(df.format(rct.getVat()));
			//customer.setSummaryAmountSumAfterVat(df.format(rct.getTotalCharge().subtract(rct.getAfterSaleDiscount())));
			BigDecimal afterSaleDiscount = (rct.getAfterSaleDiscount()!=null)?rct.getAfterSaleDiscount():BigDecimal.ZERO;
			BigDecimal afterSaleDiscVat = (rct.getAfterSaleDiscVat()!=null)?rct.getAfterSaleDiscVat():BigDecimal.ZERO;

			//customer.setSummaryAmountSumAfterVat(df.format(rct.getTotalCharge().subtract(afterSaleDiscount).subtract(afterSaleDiscVat)));//by NSD 05-04-2017
			customer.setSummaryAmountSumAfterVat(df.format(rct.getTotalCharge()));//by NSD 28-04-2017
			customer.setAdditionalDiscountAfterVat(df.format(afterSaleDiscount));
			//customer.setAmountPaid(df.format(rct.getTotalCharge().subtract(afterSaleDiscount)));
			customer.setAmountPaid(df.format(rct.getTotalCharge().subtract(afterSaleDiscount).subtract(afterSaleDiscVat)));

			customer.setBillingGroup(rct.getBillingServiceName());

			//Detail
			int i = 1;
			List<Invoice> invoices = new ArrayList<Invoice>();// invoiceRepo.findByReceiptId(rct.getId());
			for(Invoice inv : invoices) {
				if(!CollectionUtils.isEmpty(inv.getInvoiceVatDetails()) && inv.getInvoiceVatDetails().size()>1){
					for(InvoiceVatDetail dtl: inv.getInvoiceVatDetails()){
						customerInv = (CustomerTaxReceiptTO) customer.clone();
						customerInv.setOrderNo(String.valueOf(i++));
						customerInv.setInvoiceNo(!inv.getNo().equals("0")? inv.getNo():"-");
						customerInv.setPaymentCycle(!StringUtils.isEmpty(inv.getBillCycle())? inv.getBillCycle(): "-");

						customerInv.setAmountBeforeVat(df.format(dtl.getAmount()));
						customerInv.setDiscount(df.format(inv.getDiscount()));//wait for asking
						customerInv.setAmountSumBeforeVat(df.format(dtl.getAmount()));
						if(null!=dtl.getVat() && !StringUtils.equals(dtl.getTaxTypeCode(), TAX_CODE_NONVAT)){
							customerInv.setVat(df.format(dtl.getVat()));
						}else{
							customerInv.setVat("-");
						}
						customerInv.setAmountSumAfterVat(df.format(dtl.getAmount().add(dtl.getVat())));

						customerInv.setReceiptType(rct.getType());
						customerInv.setCurrencyRate(rct.getPayment().getCurrencyRate());
						if (null!=customerInv.getCurrencyRate()) {
							AmountBeforeVatTH = inv.getCharge().add(inv.getDiscount());
							AmountBeforeVatTH = AmountBeforeVatTH.multiply(customerInv.getCurrencyRate());
							customerInv.setAmountBeforeVatTH(AmountBeforeVatTH);
							customerInv.setVatRate(rct.getVatRate());

							AmountSumAfterVatTH = (inv.getCharge().add(inv.getDiscount())).add(inv.getVat());
							AmountSumAfterVatTH = AmountSumAfterVatTH.multiply(customerInv.getCurrencyRate());
							customerInv.setAmountSumAfterVatTH(AmountSumAfterVatTH);
						}
						collections.add(customerInv);
					}
				}else{
					customerInv = (CustomerTaxReceiptTO) customer.clone();
					customerInv.setOrderNo(String.valueOf(i++));
					customerInv.setInvoiceNo(!inv.getNo().equals("0")? inv.getNo():"-");
					customerInv.setPaymentCycle(!StringUtils.isEmpty(inv.getBillCycle())? inv.getBillCycle(): "-");
					customerInv.setAmountBeforeVat(df.format(inv.getCharge().add(inv.getDiscount())));
					customerInv.setDiscount(df.format(inv.getDiscount()));
					customerInv.setAmountSumBeforeVat(df.format(inv.getCharge()));
					if(null != inv.getVat()){
						customerInv.setVat(df.format(inv.getVat()));
					}else{
						customerInv.setVat("-");
					}
					customerInv.setAmountSumAfterVat(df.format(inv.getTotalCharge()));
					customerInv.setReceiptType(rct.getType());
					customerInv.setCurrencyRate(rct.getPayment().getCurrencyRate());
					if (null!=customerInv.getCurrencyRate()) {
						AmountBeforeVatTH = inv.getCharge().add(inv.getDiscount());
						AmountBeforeVatTH=AmountBeforeVatTH.multiply(customerInv.getCurrencyRate());
						customerInv.setAmountBeforeVatTH(AmountBeforeVatTH);
						customerInv.setVatRate(rct.getVatRate());
						if(null!=inv.getVat()){
							AmountSumAfterVatTH = (inv.getCharge().add(inv.getDiscount())).add(inv.getVat());
						}else{
							AmountSumAfterVatTH = (inv.getCharge().add(inv.getDiscount()));
						}
						AmountSumAfterVatTH = AmountSumAfterVatTH.multiply(customerInv.getCurrencyRate());
						customerInv.setAmountSumAfterVatTH(AmountSumAfterVatTH);
					}

					collections.add(customerInv);
				}
			}
		}

	}
    
    
    private void setReceiptFormat(Long receiptId,String receiptFormat){
		//episService.setReceiptFormat(receiptId,receiptFormat);
	}
    private void getReprintVersionOther(CustomerTaxReceiptForOthersPaymentTO documentObject,Long receiptId,String reason,String reprint,String receiptLang){
		BigDecimal category =BigDecimal.valueOf(RECEIPT_PRINT_TYPES.SUBSTITUE.ordinal()+1);
		//Integer nextVersion =episService.getNextVersionOfTrsReprint(receiptId,category,reprint);
		BigDecimal currentVersion =  new BigDecimal(1);//"1".equalsIgnoreCase(reprint)?BigDecimal.valueOf(nextVersion):BigDecimal.valueOf(nextVersion-1);
		/*th.net.cat.epis.dto.Trsreprint trsReprintByVersion = episService.getTrsReprintByVersion(receiptId, category, currentVersion);
		if(trsReprintByVersion!=null && trsReprintByVersion.getReason()!=null)
			reason = trsReprintByVersion.getReason();*/
		StringBuilder sb = new StringBuilder();
		sb.append("SUBSTITUE_REASON");
		/*if(!StringUtils.isBlank(receiptLang) && AppConstants.LANGUAGE_KEY.ENG.name().equalsIgnoreCase(receiptLang)){
			sb.append("_ENG");
		} else {
			sb.append("_TH");
		}*/
		sb.append("_TH");
		documentObject.setReasonOfSubstitute(messages.getMessage(sb.toString(), new Object[] { currentVersion }, null)+" "+reason);

	}
    private void prepareCustomerTaxReceiptForPenaltyExtendPaymentTO(List<CustomerTaxReceiptForOthersPaymentTO> collections, Receipt receipt) throws CloneNotSupportedException {
        Receipt rct = new Receipt();//receiptRepo.findOne(receipt.getId());
        DecimalFormat df = new DecimalFormat();
        df.setMaximumFractionDigits(2);
        df.setMinimumFractionDigits(2);
        df.setMinimumIntegerDigits(1);
        CustomerTaxReceiptForOthersPaymentTO customer = new CustomerTaxReceiptForOthersPaymentTO();
        CustomerTaxReceiptForOthersPaymentTO customerServ;

        String maskCC = "";//AppUtil.maskCreditCardFromString(rct.getPaymentCase(), "************####");//by NSD 26-02-2017
        String paymentCase = "";//AppUtil.hideWTNumber(maskCC);
        rct.setPaymentCase(paymentCase);

        //Header Information
        customer.setReceiptType(rct.getType());
        //Customer Information
        customer.setCustomerNo(rct.getAccountNo());
        customer.setCustomerSubNo(rct.getAccountSubNo());
        customer.setCustomerName(rct.getName());
        customer.setAddressLine1(rct.getAddrLine1());
        customer.setAddressLine2(rct.getAddrLine2());
        customer.setTaxId(rct.getTaxNo());
        customer.setBranchPayment(rct.getAccountBranch());
        customer.setPaymentType(rct.getPaymentCase());
        customer.setBranchCode(rct.getBranchCode());
        customer.setBranchName(calculateBranchName(rct));
        customer.setDocumentNo(rct.getNo());
        customer.setDocumentDate(new SimpleDateFormat(DateUtil.STANDARD_DATE_TIME_PATTERN_NO_SECONDS, ENGLISH).format(rct.getDocDttm()));//rct.getPayment().getDate().toString()); // format properly
        customer.setCustomerType(calculateCustomerTypeCode(rct.getAccountType()));

        //Additional Information
        customer.setNoteTxt(rct.getRemark());
        //customer.setPromotionTxt(rct.getPromotion());
        //customer.setPromotionTxt(getPromotionMessage(rct));
        customer.setPromotionTxt("");
        //Summary Information
        //customer.setSummaryAmountBeforeVat(df.format(rct.getCharge())); // format
       // customer.setSummaryAmountBeforeVat(df.format(rct.getAmount()));//by NSD 06-02-2017
       // customer.setSummaryDiscount(df.format(rct.getDiscount()));
        //customer.setSummaryAmountSumBeforeVat(df.format(rct.getCharge().subtract(rct.getDiscount())));
        //customer.setSummaryAmountSumBeforeVat(df.format(rct.getAmount().subtract(rct.getDiscount())));

        //customer.setSummaryVat(df.format(rct.getVat()));
        //customer.setSummaryAmountSumAfterVat(df.format(rct.getTotalCharge().subtract(rct.getAfterSaleDiscount())));
       // customer.setAmountPaid(df.format(rct.getTotalCharge()));

        //Detail
        int i = 1;
        List<Service> services = new ArrayList<Service>();//serviceRepo.findByReceiptId(rct.getId());
//		th.net.cat.epis.entity.Enum  serviceEnum = null;
		BigDecimal sumAmt = new BigDecimal(0);
        for(Service ser : services) {
			sumAmt = sumAmt.add(ser.getAmount());
//			serviceEnum = enumRepo.findByCategoryAndCode("payothers.service.name", ser.getProductName()).get(0);
            customerServ = (CustomerTaxReceiptForOthersPaymentTO) customer.clone();
            customerServ.setOrderNo(String.valueOf(i++));
            customerServ.setProductType(ser.getIncomeType());
            customerServ.setProductName(ser.getProductName());
            customerServ.setProductCode(ser.getProductCode());
            //customerServ.setAmount(df.format(ser.getCharge()));
            customerServ.setAmount(df.format(ser.getAmount()));//by NSD 06-02-2017
           // customerServ.setVat(df.format(ser.getVat()));
            //customerServ.setDiscount(df.format(ser.getDiscount()));
            //customerServ.setAmountBeforeVatAfterDiscount(df.format(ser.getCharge()));
           // customerServ.setWat(df.format(ser.getDeduction()));
            customerServ.setTotalSum(df.format(ser.getTotalCharge()));
            collections.add(customerServ);
        }
        collections.get(0).setSummaryAmountSumAfterVat(df.format(sumAmt));
    }
    private String calculateBranchName(Receipt rct) {
		return (rct.getBranchCode().equalsIgnoreCase("00000"))
				? "สำนักงานใหญ่ "+ rct.getBranchCode()+" "+rct.getBranchName()
				: (rct.getFlgHeader().equalsIgnoreCase("2") ? "สาขาที่ออกใบเสร็จรับเงิน คือ "+ rct.getBranchCode()+" "+rct.getBranchName() : "สาขาที่ออกใบกำกับภาษี คือ "+ rct.getBranchCode()+" "+rct.getBranchName());
	}
   
	@Override
	public void setServletContext(ServletContext arg0) {
		// TODO Auto-generated method stub
		
	}
	private String calculateBranchNameForReceiptLang(Receipt receipt,String receiptLang) {
		Receipt rtc = new Receipt();//receiptRepo.findOne(receipt.getId());
		logger.info("rtc.getBranchCode()["+rtc.getBranchCode()+"] receiptLang["+receiptLang+"]");
		rtc.setBranchCode("test");
		rtc.setBranchName("test");
		return (rtc.getBranchCode().equals("00000")) 
				? ((!StringUtils.isEmpty(receiptLang) && receiptLang.equals(AppConstants.LANGUAGE_KEY.ENG.name()))?"Head Office ":"สำนักงานใหญ่ ")+ rtc.getBranchCode()+" "+rtc.getBranchName() 
				: ((!StringUtils.isEmpty(receiptLang) && receiptLang.equals(AppConstants.LANGUAGE_KEY.ENG.name()))?"Branch issued Tax invoice ":"สาขาที่ออกใบกำกับภาษี คือ ")+ rtc.getBranchCode()+" "+rtc.getBranchName();
	}
	private String calculateCustomerTypeCode(String customerType) {
		String type = stripToEmpty(customerType).toLowerCase(); 
		if (type.indexOf("individual") == 0) {
			return RECEIPT_ACCOUNT_TYPE_CODE_INDIVIDUAL;
		} else if (type.indexOf("organization") == 0) {
			return RECEIPT_ACCOUNT_TYPE_CODE_ORGANIZATION;
		} else if (type.indexOf("stateagency") == 0) {
			return RECEIPT_ACCOUNT_TYPE_CODE_GOVERNMENT;
		} else {
			throw new UnsupportedOperationException("Please specify the customer type is INDIVIDUAL or ORGANIZATION or STATEAGENCY");
		}
	}
	
	private void getReprintVersion(CustomerTaxReceiptTO documentObject,Long receiptId,String reason,String reprint,String receiptLang){
		BigDecimal category =BigDecimal.valueOf(RECEIPT_PRINT_TYPES.SUBSTITUE.ordinal()+1);
		Integer nextVersion =1;//episService.getNextVersionOfTrsReprint(receiptId,category,reprint);
		BigDecimal currentVersion =  "1".equalsIgnoreCase(reprint)?BigDecimal.valueOf(nextVersion):BigDecimal.valueOf(nextVersion-1);
		th.net.cat.epis.dto.Trsreprint trsReprintByVersion = new th.net.cat.epis.dto.Trsreprint();//episService.getTrsReprintByVersion(receiptId, category, currentVersion);
		if(trsReprintByVersion!=null && trsReprintByVersion.getReason()!=null)
			reason = trsReprintByVersion.getReason();
		StringBuilder sb = new StringBuilder();
		sb.append("SUBSTITUE_REASON");
		if(!StringUtils.isBlank(receiptLang) && AppConstants.LANGUAGE_KEY.ENG.name().equalsIgnoreCase(receiptLang)){
			sb.append("_ENG");
		} else {
			sb.append("_TH");
		}

		documentObject.setReasonOfSubstitute(messages.getMessage(sb.toString(), new Object[] { currentVersion }, null)+" "+reason);

	}
	//by NSD 23-02-2017
	
	
	private String getPromotionMessage(Receipt rct){
		final StringBuilder sb=new StringBuilder();
		
				/*	episJdbcTemplate.query(
							 " select  promotion.* from PROMOTION_BILLING_MAPPING pro_mapping left join "+
							 " MASPACKAGE_PROMOTION promotion on (promotion.PACKAGE_ID= pro_mapping.PROMOTION_ID ) "+
							 " where pro_mapping.ACCOUNT_NO='"+rct.getAccountNo()+"' ", new RowCountCallbackHandler(){
					@Override
					public void processRow(ResultSet resultSet, int rowNum) throws SQLException {
						sb.append(resultSet.getString("PROMOTION")+"\n");
					}
				});*/
		return sb.toString();
	}
}
