package th.net.cat.epis;

import static org.apache.commons.lang.StringUtils.isNotBlank;
import static org.springframework.http.MediaType.APPLICATION_JSON;

import java.io.IOException;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Locale;
//import java.util.Map;
import java.util.Properties;
import java.util.Set;
import java.util.TimeZone;
import java.util.concurrent.Executor;
import java.util.concurrent.Executors;
//import java.util.TreeMap;
import java.util.concurrent.TimeUnit;

import javax.annotation.Resource;
import javax.persistence.EntityManagerFactory;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpServletResponseWrapper;
import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Import;
import org.springframework.context.annotation.ImportResource;
import org.springframework.context.annotation.Profile;
import org.springframework.context.support.PropertySourcesPlaceholderConfigurer;
import org.springframework.core.convert.converter.Converter;
import org.springframework.core.env.Environment;
import org.springframework.core.io.ClassPathResource;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
import org.springframework.data.rest.core.config.RepositoryRestConfiguration;
import org.springframework.data.rest.core.mapping.RepositoryDetectionStrategy;
import org.springframework.data.rest.webmvc.config.RepositoryRestConfigurerAdapter;
import org.springframework.data.rest.webmvc.config.RepositoryRestMvcConfiguration;
import org.springframework.format.FormatterRegistry;
import org.springframework.http.CacheControl;
import org.springframework.http.converter.HttpMessageConverter;
import org.springframework.http.converter.json.MappingJackson2HttpMessageConverter;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.orm.jpa.JpaTransactionManager;
import org.springframework.orm.jpa.LocalContainerEntityManagerFactoryBean;
import org.springframework.orm.jpa.vendor.Database;
import org.springframework.orm.jpa.vendor.HibernateJpaVendorAdapter;
import org.springframework.scheduling.annotation.EnableAsync;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.SchedulingConfigurer;
import org.springframework.scheduling.config.ScheduledTaskRegistrar;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.authentication.encoding.Md5PasswordEncoder;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.access.intercept.FilterSecurityInterceptor;
import org.springframework.security.web.authentication.AnonymousAuthenticationFilter;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.security.web.authentication.WebAuthenticationDetails;
import org.springframework.security.web.context.AbstractSecurityWebApplicationInitializer;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.web.accept.ContentNegotiationManager;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;
import org.springframework.web.servlet.View;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.config.annotation.ContentNegotiationConfigurer;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;
import org.springframework.web.servlet.support.AbstractAnnotationConfigDispatcherServletInitializer;
import org.springframework.web.servlet.view.ContentNegotiatingViewResolver;
import org.springframework.web.servlet.view.InternalResourceViewResolver;
import org.springframework.web.servlet.view.JstlView;
import org.springframework.web.servlet.view.json.MappingJackson2JsonView;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.SerializationFeature;

import springfox.documentation.swagger2.annotations.EnableSwagger2;
import th.net.cat.epis.controller.EpContextHolder;

public class EpWebApplicationInitializer extends AbstractAnnotationConfigDispatcherServletInitializer {

	@Override
	public void onStartup(ServletContext servletContext) throws ServletException {
		super.onStartup(servletContext);
		// ServletRegistration.Dynamic cxfServlet =
		// servletContext.addServlet("repositoryRestDispatcher",
		// RepositoryRestDispatcherServlet.class);
		// cxfServlet.setLoadOnStartup(1);
		// cxfServlet.addMapping("/service/*");
	}

	protected Class<?>[] getRootConfigClasses() {
		return new Class[] { RootContextConfig.class, SecurityConfig.class, EpisRepositoryConfiguration.class,
				ScheduleConfig.class
				// ,BatchConfiguration.class
				// ,ViewCrmRepositoryConfiguration.class
				// ,BillingRepositoryConfiguration.class
				// ,ContextBatch.class
				// ,ContextIntegration.class
		};
	}

	protected Class<?>[] getServletConfigClasses() {
		return new Class[] { WebConfiguration.class };
	}

	protected String[] getServletMappings() {
		return new String[] { "/" };
	}

	protected Filter[] getServletFilters() {
		return new Filter[] { new EpContextHolder.Filter() };
	}

	static final String AUTHORITY_ADMIN = "ADMIN";
	static final String AUTHORITY_SUP = "Suppervisor";
	static final String AUTHORITY_AGENT = "AGENT";
	static final String AUTHORITY_BASIC = "BASIC";
	static final String AUTHORITY_GFMISAGENT = "GFMISAGENT";
	static final String PAGE_LOGIN = "/pages/login.jsp";
	static final String PAGE_MAIN_ADMIN = "/admin/main.jsp";
	static final String PAGE_MAIN_AGENT = "/pages/main.jsp";
	static final String PAGE_ERROR = "/pages/error500.jsp";

	/*
	 * JavaScript: For checking, if session is expired in frame. if (window.self !==
	 * window.top) { window.top.location = "login.jsp?session_expired"; }
	 */
	public static class CharsetFilter implements javax.servlet.Filter {
		private String encoding = "UTF-8";

		@Override
		public void init(FilterConfig config) throws ServletException {
		}

		@Override
		public void doFilter(ServletRequest request, ServletResponse response, FilterChain next)
				throws IOException, ServletException {
			System.out.println("CharsetFilter");
			// Respect the client-specified character encoding
			// (see HTTP specification section 3.4.1)
			if (null == request.getCharacterEncoding()) {
				request.setCharacterEncoding(encoding);
			}
			// Set the default response content type and encoding
			response.setContentType("text/html; charset=UTF-8");
			response.setCharacterEncoding("UTF-8");
			next.doFilter(request, response);
		}

		@Override
		public void destroy() {
		}
	}

	public static class CheckRequestUriFilter implements javax.servlet.Filter {
		@Override
		public void init(FilterConfig fc) throws ServletException {
		}

		@Override
		public void destroy() {
		}

		@Override
		public void doFilter(ServletRequest rq, ServletResponse rs, FilterChain fc) {
			System.out.println("CheckRequestUriFilter");
			final HttpInfo httpInfo = new HttpInfo();
			HttpServletRequest req = new HttpServletRequestWrapper((HttpServletRequest) rq);
			HttpServletResponse res = new HttpServletResponseWrapper((HttpServletResponse) rs) {
				@Override
				public void sendError(int sc) throws IOException {
					httpInfo.errorCode = sc;
				}

				@Override
				public void sendError(int sc, String msg) throws IOException {
					httpInfo.errorCode = sc;
				}
			};
			String rqUri = req.getRequestURI();
			String ctxPt = req.getContextPath();
			if (rqUri.equals(ctxPt) || rqUri.equals(new StringBuilder(ctxPt).append("/").toString())
					|| rqUri.equals(new StringBuilder(ctxPt).append("/index.html").toString()) || rqUri.endsWith("/")) {
				try {
					res.sendRedirect(new StringBuilder(ctxPt).append(PAGE_LOGIN).toString());
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				return;
			}
			try {
				System.out.println("RequestURI: " + rqUri);
				System.out.println("Accept: " + req.getHeader("accept"));
				fc.doFilter(req, res);
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				if (httpInfo.errorCode != 0) {
					try {
						res.sendRedirect(new StringBuilder(ctxPt).append(PAGE_ERROR).toString());
					} catch (IOException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
			}
		}
	}

	public static abstract class ContextHolderFilter<T> implements javax.servlet.Filter {
		protected static ContextHolderFilter<?> FILTER;
		protected FilterConfig filterConfig;
		protected JdbcTemplate jdbcTemplate;
		@Override public void destroy() {}
		@Override public void init(FilterConfig filterConfig) throws ServletException { this.filterConfig = filterConfig; }
		@SuppressWarnings("unchecked")
		@Override
		public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
			System.out.println("ContextHolderFilter");
			HttpServletRequest request = (HttpServletRequest) servletRequest;
			String user = SecurityContextHolder.getContext().getAuthentication() == null ? null : SecurityContextHolder.getContext().getAuthentication().getName();
			Object context = request.getSession().getAttribute("epContext");
			if (context == null && isNotBlank(user) && !"anonymousUser".equals(user)) {
				request.getSession().setAttribute("epContext", context = newContext());
			}
			setContext((T) context);
			filterChain.doFilter(servletRequest, servletResponse);
		}
		public static javax.servlet.Filter init(JdbcTemplate jdbcTemplate) { FILTER.jdbcTemplate = jdbcTemplate; return FILTER; }
		public abstract void setContext(T t);
		public abstract T newContext();
	}
	public static class CheckLoggedInFilter implements javax.servlet.Filter {
		@Override
		public void init(FilterConfig paramFilterConfig) throws ServletException {
		}

		@Override
		public void destroy() {
		}

		@Override
		public void doFilter(ServletRequest rq, ServletResponse rs, FilterChain fc) {
			System.out.println("CheckLoggedInFilter");
			HttpServletRequest req = new HttpServletRequestWrapper((HttpServletRequest) rq);
			HttpServletResponse res = new HttpServletResponseWrapper((HttpServletResponse) rs);
			String rqUri = req.getRequestURI();
			String ctxPt = req.getContextPath();
			Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
			if (rqUri.equals(new StringBuilder(ctxPt).append(PAGE_LOGIN).toString()) && authentication != null
					&& authentication.isAuthenticated()
					&& authentication instanceof UsernamePasswordAuthenticationToken) {

				WebApplicationContext wac = WebApplicationContextUtils.getWebApplicationContext(rq.getServletContext());
				// OfficerRepository officerRepository = (OfficerRepository)
				// wac.getBean(OfficerRepository.class);
				// Officer officer =
				// officerRepository.findByName((String)authentication.getPrincipal());
				// Officer officer =
				// officerRepository.findByName((String)authentication.getPrincipal());//comment
				// by kao 25600707
				// start add by kao 25600707
				// Officer officer = new Officer();//officerRepository.findByName(((UserDetails)
				// authentication.getPrincipal()).getUsername());
				// end add by kao 25600707
				// if(officer != null && !"Y".equalsIgnoreCase(officer.getVerifyFlag())){
				String grantedUserAuthority = null;
				Collection<? extends GrantedAuthority> authorities = authentication.getAuthorities();
				for (GrantedAuthority grantedAuthority : authorities) {
					grantedUserAuthority = grantedAuthority.getAuthority();
				}
				try {
					res.sendRedirect(new StringBuilder(ctxPt)
							.append(AUTHORITY_ADMIN.equals(grantedUserAuthority) ? PAGE_MAIN_ADMIN : PAGE_MAIN_AGENT)
							.toString());
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				return;
				// }else{
				//// Map<String, String[]> paramMap = new TreeMap<String, String[]>();
				// //rq.getParameterMap();
				//// paramMap.put("username", new
				// String[]{(String)authentication.getPrincipal()});
				//// paramMap.put("password", new String[]{""});
				//// HttpServletRequest rqWrapper = new EpRequestWrapper((HttpServletRequest)rq,
				// paramMap);
				//// rq.getRequestDispatcher(PAGE_LOGIN).forward(rqWrapper, rs);
				//// return;
				// }
			}
			try {
				fc.doFilter(rq, rs);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (ServletException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

	public static class CheckSSOLoggedInFilter implements javax.servlet.Filter {

		@Override
		public void init(FilterConfig paramFilterConfig) throws ServletException {
		}

		@Override
		public void destroy() {
		}

		@Override
		public void doFilter(ServletRequest rq, ServletResponse rs, FilterChain fc)
				throws IOException, ServletException {
			System.out.println("CheckSSOLoggedInFilter");
			HttpServletRequest req = new HttpServletRequestWrapper((HttpServletRequest) rq);
			String application = (null == rq.getParameter("ap") ? null : (String) rq.getParameter("ap"));
			if (application != null && application.equals("SSO")) {
				System.out.println("## SSO Authen Here ##");
				String username = (null == rq.getParameter("un") ? null : (String) rq.getParameter("un"));
				String password = (null == rq.getParameter("pw") ? null : (String) rq.getParameter("pw"));
				System.out.println("## Request Parameters [un = " + username + ", pw  = " + password + ", ap = "
						+ application + "]");
				doAutoLogin(req, username, password);
			}
			fc.doFilter(rq, rs);
		}
	}

	public static void doAutoLogin(HttpServletRequest req, String username, String password) {

		// Authentication authenticate = new
		// UsernamePasswordAuthenticationToken(username, password);
		// Collection<? extends GrantedAuthority> authorities =
		// authenticate.getAuthorities();
		// String grantedUserAuthority = null;
		// for(GrantedAuthority grantedAuthority : authorities ) {
		// grantedUserAuthority = grantedAuthority.getAuthority();
		// }
		System.out.println("doAutoLogin");
		// Default Role End User.
		List<GrantedAuthority> grantedAuthorities = AuthorityUtils.createAuthorityList(AUTHORITY_AGENT);
		// Must be called from request filtered by Spring Security, otherwise
		// SecurityContextHolder is not updated
		UsernamePasswordAuthenticationToken token = new UsernamePasswordAuthenticationToken(username, password,
				grantedAuthorities);
		token.setDetails(new WebAuthenticationDetails(req));
		System.out.println("Logging in with = " + token.getPrincipal());
		SecurityContextHolder.getContext().setAuthentication(token);

	}

	public static class HttpInfo {
		public int errorCode = 0;
	}

	@Configuration
	@EnableWebMvc
	@EnableSwagger2
	@ComponentScan(basePackages = { "th.net.cat.epis.*", }) // "org.springframework.data.rest.webmvc.halbrowser"
																		// })
	@Import(RepositoryRestMvcConfiguration.class)
	public static class WebConfiguration extends WebMvcConfigurerAdapter {

		@Override
		public void configureContentNegotiation(ContentNegotiationConfigurer configurer) {
			configurer.ignoreAcceptHeader(true).defaultContentType(APPLICATION_JSON);
		}

		@Override
		public void configureMessageConverters(List<HttpMessageConverter<?>> converters) {
			ObjectMapper mapper = new ObjectMapper();
			mapper.configure(SerializationFeature.FAIL_ON_EMPTY_BEANS, false);
			converters.add(new MappingJackson2HttpMessageConverter(mapper));
		}

		@Override
		public void addFormatters(FormatterRegistry formatterRegistry) {
			formatterRegistry.addConverter(new Converter<String, Date>() {
				@Override
				public Date convert(String source) {
					try {
						SimpleDateFormat simpleDateFormat = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss", Locale.ENGLISH);
						simpleDateFormat.setLenient(false);
						return simpleDateFormat.parse(source);
					} catch (ParseException e) {
						e.printStackTrace();
					}
					return null;
				}
			});
		}

		@Bean
		public ViewResolver contentNegotiatingViewResolver(ContentNegotiationManager manager) {
			ContentNegotiatingViewResolver resolver = new ContentNegotiatingViewResolver();
			resolver.setContentNegotiationManager(manager);

			// Define all possible view resolvers
			List<ViewResolver> resolvers = new ArrayList<ViewResolver>();
			resolvers.add(jspViewResolver());
			resolver.setViewResolvers(resolvers);

			List<View> defaultViews = new ArrayList<View>();
			defaultViews.add(new MappingJackson2JsonView());
			resolver.setDefaultViews(defaultViews);
			return resolver;
		}

		@Bean
		public ViewResolver jspViewResolver() {
			InternalResourceViewResolver viewResolver = new InternalResourceViewResolver();
			viewResolver.setViewClass(JstlView.class);
			viewResolver.setPrefix("/pages/");
			viewResolver.setSuffix(".jsp");
			viewResolver.setOrder(2);
			return viewResolver;
		}

		@Override
		public void addResourceHandlers(ResourceHandlerRegistry registry) {
			registry.addResourceHandler("/pages/resources/**")
					.addResourceLocations("/option/", "/bootstrap-table-1.8.1/", "/bootstrap-validator-0.9.0/",
							"/images/", "/commons/")
					.setCacheControl(CacheControl.maxAge(1, TimeUnit.HOURS).cachePublic());
			registry.addResourceHandler("/jnlp/**").addResourceLocations("/jnlp/");
			registry.addResourceHandler("swagger-ui.html").addResourceLocations("classpath:/META-INF/resources/");
			registry.addResourceHandler("/webjars/**").addResourceLocations("classpath:/META-INF/resources/webjars/");
		}
	}

	/*
	 * Please make sure that "INSERT" & "UPDATE" transactions must be placed in the
	 * "th.net.cat.epis.service" package.
	 */
	@Configuration
	@Profile("default")
	@EnableTransactionManagement(proxyTargetClass = true)
	@EnableAsync
	@EnableScheduling
	@ComponentScan(basePackages = { "th.net.cat.epis.service", "th.net.cat.epis.report", "th.net.cat.epis.batch",
			"th.net.cat.epis.ws.service", "th.net.cat.epis.initial" })
	// @ImportResource({"classpath:applicationContext.xml",
	// "classpath:client-beans.xml", "classpath:cxf.xml"})
	@ImportResource({ "classpath:applicationContext.xml" })
	public static class RootContextConfig {

		@Autowired
		Environment env; // e.g. spring.profile.active
		// EPIS DB
		@Value("${jdbc.epis.driver}")
		String jdbcEpisDriver;
		@Value("${jdbc.epis.url}")
		String jdbcEpisUrl;
		@Value("${jdbc.epis.username}")
		String jdbcEpisUsername;
		@Value("${jdbc.epis.password}")
		String jdbcEpisPassword;
		/*
		 * // CRM DB
		 * 
		 * @Value("${jdbc.viewcrm.driver}") String jdbcViewCRMDriver;
		 * 
		 * @Value("${jdbc.viewcrm.url}") String jdbcViewCRMUrl;
		 * 
		 * @Value("${jdbc.viewcrm.username}") String jdbcViewCRMUsername;
		 * 
		 * @Value("${jdbc.viewcrm.password}") String jdbcViewCRMPassword; // Billing DB
		 * 
		 * @Value("${jdbc.billing.driver}") String jdbcBillingDriver;
		 * 
		 * @Value("${jdbc.billing.url}") String jdbcBillingUrl;
		 * 
		 * @Value("${jdbc.billing.username}") String jdbcBillingUsername;
		 * 
		 * @Value("${jdbc.billing.password}") String jdbcBillingPassword;
		 */

		@Bean
		public DataSource episDataSource() throws SQLException {
			DriverManagerDataSource dataSource = new DriverManagerDataSource();
			// System.out.println(" jbc url.proper :"+jdbcEpisUrl);
			dataSource.setDriverClassName(jdbcEpisDriver);
			dataSource.setUrl(jdbcEpisUrl);
			dataSource.setUsername(jdbcEpisUsername);
			dataSource.setPassword(jdbcEpisPassword);
			return dataSource;
		}

		/*
		 * @Bean public DataSource viewCrmDataSource() throws SQLException {
		 * th.net.cat.epis.EpDataSource dataSource = new th.net.cat.epis.EpDataSource();
		 * dataSource.setURL(jdbcViewCRMUrl); dataSource.setUser(jdbcViewCRMUsername);
		 * dataSource.setPassword(jdbcViewCRMPassword); return dataSource; }
		 * 
		 * @Bean public DataSource billingDataSource() throws SQLException {
		 * th.net.cat.epis.EpDataSource dataSource = new th.net.cat.epis.EpDataSource();
		 * dataSource.setURL(jdbcBillingUrl); dataSource.setUser(jdbcBillingUsername);
		 * dataSource.setPassword(jdbcBillingPassword); return dataSource; }
		 */
		@Bean
		public JdbcTemplate episJdbcTemplate(@Qualifier("episDataSource") DataSource dataSource) throws SQLException {
			return new JdbcTemplate(dataSource);
		}

		@Bean
		public NamedParameterJdbcTemplate episNamedParamJdbcTemplate(@Qualifier("episDataSource") DataSource dataSource)
				throws SQLException {
			return new NamedParameterJdbcTemplate(dataSource);
		}

		/*
		 * @Bean public JdbcTemplate viewCrmJdbcTemplate(@Qualifier("viewCrmDataSource")
		 * DataSource dataSource) throws SQLException { return new
		 * JdbcTemplate(dataSource); }
		 * 
		 * @Bean public JdbcTemplate billingJdbcTemplate(@Qualifier("billingDataSource")
		 * DataSource dataSource) throws SQLException { return new
		 * JdbcTemplate(dataSource); }
		 */
		@Bean
		public RepositoryRestConfigurerAdapter repositoryRestConfigurer() {
			return new RepositoryRestConfigurerAdapter() {
				@Override
				public void configureRepositoryRestConfiguration(RepositoryRestConfiguration config) {
					// Access URL: http://localhost:8088/cat-epis-web/service/browser/index.html
					config.setBasePath("/service");
					config.setDefaultPageSize(200);
					config.setMaxPageSize(50000);
					config.setRepositoryDetectionStrategy(
							RepositoryDetectionStrategy.RepositoryDetectionStrategies.ANNOTATED);
					Set<Class<?>> classes = new HashSet<Class<?>>();
					/*
					 * classes.addAll(new
					 * Reflections("th.net.cat.epis.entity").getTypesAnnotatedWith(Entity.class));
					 * classes.addAll(new
					 * Reflections("th.net.cat.crm.entity").getTypesAnnotatedWith(Entity.class));
					 * classes.addAll(new
					 * Reflections("th.net.cat.erp.entity").getTypesAnnotatedWith(Entity.class));
					 * classes.addAll(new
					 * Reflections("th.net.cat.billing.entity").getTypesAnnotatedWith(Entity.class))
					 * ;
					 */
					config.exposeIdsFor(classes.toArray(new Class[0]));
				}
			};
		}

		@Bean
		public static PropertySourcesPlaceholderConfigurer propertySourcesPlaceholderConfigurer() {
			// Reference: System.getProperty("java.home") +"/lib/tzdb.dat"
			TimeZone.setDefault(TimeZone.getTimeZone("Asia/Bangkok")); // if no operating system time zone will be used.
			String profile = System.getProperty("spring.profile.active", "sit");
			PropertySourcesPlaceholderConfigurer pspc = new PropertySourcesPlaceholderConfigurer();
			pspc.setLocations(new ClassPathResource[] { new ClassPathResource(profile + ".properties") });
			return pspc;
		}
	}

	/*
	 * # logs the SQL statements log4j.logger.org.hibernate.SQL=debug # Logs the
	 * JDBC parameters passed to a query log4j.logger.org.hibernate.type=trace
	 */
	@EnableJpaRepositories(basePackages = { "th.net.cat.epis.repo",
			"th.net.cat.erp.repo" }, entityManagerFactoryRef = "episEntityManagerFactory")
	public static class EpisRepositoryConfiguration {
		@Bean // @PersistenceContext(unitName="episEntityManagerFactory") EntityManager em;
		public LocalContainerEntityManagerFactoryBean episEntityManagerFactory(
				@Qualifier("episDataSource") DataSource dataSource) throws SQLException {
			Properties jpaProperties = new Properties();
			// jpaProperties.put("hibernate.hbm2ddl.auto", "validate"); // create-drop
			jpaProperties.put("hibernate.dialect", "org.hibernate.dialect.MySQL5Dialect");
			jpaProperties.put("hibernate.show_sql", "true");
			jpaProperties.put("hibernate.format_sql", "true");
			/*
			 * jpaProperties.put("hibernate.connection.characterEncoding", "utf8");
			 * jpaProperties.put("hibernate.connection.CharSet", "utf8");
			 * jpaProperties.put("hibernate.connection.useUnicode", "true");
			 */
			HibernateJpaVendorAdapter jpaVendorAdapter = new HibernateJpaVendorAdapter();
			jpaVendorAdapter.setShowSql(true);
			jpaVendorAdapter.setDatabase(Database.ORACLE);
			LocalContainerEntityManagerFactoryBean entityManagerFactory = new LocalContainerEntityManagerFactoryBean();
			entityManagerFactory.setDataSource(dataSource);
			// entityManagerFactory.setPackagesToScan("th.net.cat.epis.entity",
			// "th.net.cat.erp.entity");
			entityManagerFactory.setPackagesToScan("th.net.cat.epis.entity");
			entityManagerFactory.setJpaVendorAdapter(jpaVendorAdapter);
			entityManagerFactory.setJpaProperties(jpaProperties);
			return entityManagerFactory;
		}

		/*
		 * log4j.logger.org.springframework.orm.jpa=DEBUG
		 * log4j.logger.org.springframework.transaction=DEBUG
		 */
		@Bean
		public PlatformTransactionManager transactionManager(
				@Qualifier("episEntityManagerFactory") EntityManagerFactory entityManagerFactory) {
			JpaTransactionManager transactionManager = new JpaTransactionManager();
			transactionManager.setEntityManagerFactory(entityManagerFactory);
			return transactionManager;
		}
	}

	/*
	 * @EnableJpaRepositories(basePackages = { "th.net.cat.crm.repo" },
	 * entityManagerFactoryRef="viewCrmEntityManagerFactory") public static class
	 * ViewCrmRepositoryConfiguration {
	 * 
	 * @Bean public LocalContainerEntityManagerFactoryBean
	 * viewCrmEntityManagerFactory(@Qualifier("viewCrmDataSource") DataSource
	 * dataSource) throws SQLException { Properties jpaProperties = new
	 * Properties(); // jpaProperties.put("hibernate.hbm2ddl.auto", "validate");
	 * jpaProperties.put("hibernate.dialect",
	 * org.hibernate.dialect.Oracle10gDialect.class.getName());
	 * jpaProperties.put("hibernate.show_sql", "true");
	 * jpaProperties.put("hibernate.format_sql", "true");
	 * jpaProperties.put("hibernate.default_schema", "crmdata");
	 * HibernateJpaVendorAdapter jpaVendorAdapter = new HibernateJpaVendorAdapter();
	 * jpaVendorAdapter.setShowSql(true);
	 * jpaVendorAdapter.setDatabase(Database.ORACLE);
	 * LocalContainerEntityManagerFactoryBean entityManagerFactory = new
	 * LocalContainerEntityManagerFactoryBean();
	 * entityManagerFactory.setDataSource(dataSource);
	 * entityManagerFactory.setPackagesToScan("th.net.cat.crm.entity");
	 * entityManagerFactory.setJpaVendorAdapter(jpaVendorAdapter);
	 * entityManagerFactory.setJpaProperties(jpaProperties); return
	 * entityManagerFactory; } }
	 */
	/*
	 * @EnableJpaRepositories(basePackages = { "th.net.cat.billing.repo" },
	 * entityManagerFactoryRef="billingEntityManagerFactory") public static class
	 * BillingRepositoryConfiguration {
	 * 
	 * @Bean public LocalContainerEntityManagerFactoryBean
	 * billingEntityManagerFactory(@Qualifier("billingDataSource") DataSource
	 * dataSource) throws SQLException { Properties jpaProperties = new
	 * Properties(); jpaProperties.put("hibernate.dialect",
	 * org.hibernate.dialect.Oracle10gDialect.class.getName());
	 * jpaProperties.put("hibernate.show_sql", "true");
	 * jpaProperties.put("hibernate.format_sql", "true");
	 * jpaProperties.put("hibernate.default_schema", "pay_epis");
	 * HibernateJpaVendorAdapter jpaVendorAdapter = new HibernateJpaVendorAdapter();
	 * jpaVendorAdapter.setShowSql(true);
	 * jpaVendorAdapter.setDatabase(Database.ORACLE);
	 * LocalContainerEntityManagerFactoryBean entityManagerFactory = new
	 * LocalContainerEntityManagerFactoryBean();
	 * entityManagerFactory.setDataSource(dataSource);
	 * entityManagerFactory.setPackagesToScan("th.net.cat.billing.entity");
	 * entityManagerFactory.setJpaVendorAdapter(jpaVendorAdapter);
	 * entityManagerFactory.setJpaProperties(jpaProperties); return
	 * entityManagerFactory; } }
	 * 
	 */ public static class SecurityWebApplicationInitializer extends AbstractSecurityWebApplicationInitializer {
	}

	@Configuration
	@EnableWebSecurity
	public static class SecurityConfig extends WebSecurityConfigurerAdapter {

		@Resource(name = "episJdbcTemplate")
		JdbcTemplate jdbcTemplate;

		@Autowired
		public void configureGlobal(AuthenticationManagerBuilder auth,
				@Qualifier("episDataSource") DataSource dataSource) throws Exception {
			// auth
			// .inMemoryAuthentication()
			// .withUser("EPIS").password("password").roles("USER");
			auth.jdbcAuthentication().passwordEncoder(new Md5PasswordEncoder()).dataSource(dataSource)
					.usersByUsernameQuery(
							"SELECT offi.username as username, auth.password as password, CASE WHEN offi.ispositive = 1 THEN 1 ELSE 0 END as enabled FROM ARCUSERAUTHNTICN auth LEFT JOIN MASOFFICER offi ON offi.officerid = auth.officerid WHERE offi.username = ?")
					.authoritiesByUsernameQuery(
							"SELECT offi.username as username, prin.name as authority FROM ARCUSERAUTHNTICN auth LEFT JOIN MASOFFICER offi ON offi.officerid = auth.officerid LEFT JOIN ARCPRINCIPAL prin ON prin.principalid = offi.principalid where offi.username = ?");
		}

		@Override
		protected void configure(HttpSecurity http) throws Exception {
			http
			.addFilterBefore(new CharsetFilter(), AnonymousAuthenticationFilter.class)
			.addFilterAfter(new CheckSSOLoggedInFilter(), AnonymousAuthenticationFilter.class)
			.addFilterAfter(new CheckLoggedInFilter(), AnonymousAuthenticationFilter.class)
			.addFilterAfter(new CheckRequestUriFilter(), FilterSecurityInterceptor.class)
			.addFilterAfter(ContextHolderFilter.init(jdbcTemplate), CheckRequestUriFilter.class);
			http.sessionManagement().maximumSessions(1)/* .maxSessionsPreventsLogin(true) */;
			http.headers().frameOptions().disable().and().csrf().disable().authorizeRequests().antMatchers("/jnlp/**")
					.permitAll().antMatchers("/**/*.css").permitAll().antMatchers("/**/*.js").permitAll()
					.antMatchers("/**/*.png").permitAll().antMatchers("/**/*.ttf").permitAll().antMatchers("/pages/**")
					.permitAll()
					// .antMatchers("/pages/**").permitAll()
					// .antMatchers("/pages/**").hasAnyAuthority(,AUTHORITY_BASIC, AUTHORITY_AGENT,
					// AUTHORITY_GFMISAGENT, AUTHORITY_ADMIN,AUTHORITY_SUP)
					// .antMatchers("/admin/**").hasAnyAuthority(AUTHORITY_ADMIN)
					// .antMatchers("/admin/**").authenticated()
					.anyRequest().authenticated().and().formLogin().loginPage(PAGE_LOGIN)
					.loginProcessingUrl("/pages/login").failureUrl(PAGE_LOGIN + "?wrongAuthen")
					// .defaultSuccessUrl(PAGE_MAIN, true)
					.successHandler(new AuthenticationSuccessHandler() {
						@Override
						public void onAuthenticationSuccess(HttpServletRequest req, HttpServletResponse res,
								Authentication auth) throws IOException, ServletException {
							String contextPath = req.getContextPath();
							/*
							 * org.springframework.security.core.GrantedAuthority[] grantedAuthorities =
							 * auth.getAuthorities().toArray(new
							 * org.springframework.security.core.GrantedAuthority[0]); if
							 * (grantedAuthorities == null || grantedAuthorities.length < 1) {
							 * res.sendRedirect(contextPath + PAGE_LOGIN); return; } else if
							 * ("ADMIN".equals(grantedAuthorities[0].getAuthority())) {
							 * res.sendRedirect(contextPath + PAGE_MAIN_ADMIN); return; } ?
							 */
							res.sendRedirect(contextPath + PAGE_MAIN_AGENT);/// move to home controller
							// res.sendRedirect(contextPath+"/main.jsp");

						}
					}).failureHandler(new AuthenticationFailureHandler() {
						@Override
						public void onAuthenticationFailure(HttpServletRequest req, HttpServletResponse res,
								AuthenticationException auth) throws IOException, ServletException {
							String contextPath = req.getContextPath();
							res.sendRedirect(contextPath + PAGE_LOGIN);
							return;
						}
					}).permitAll().and().logout().invalidateHttpSession(true).logoutUrl("/pages/logout");
		}
	}

	@Configuration
	@EnableScheduling
	public static class ScheduleConfig implements SchedulingConfigurer {

//		@Bean
//		public ScheduleObjToJson bean() {
//			System.out.println("========schedule config");
//			return new ScheduleObjToJson();
//		}

		@Override
		public void configureTasks(ScheduledTaskRegistrar taskRegistrar) {

			taskRegistrar.setScheduler(taskExecutor());
		}

		@Bean(destroyMethod = "shutdown")
		public Executor taskExecutor() {
			return Executors.newScheduledThreadPool(1);
			// return null;
		}

	}
	/*
	 * 
	 * @Configuration
	 * 
	 * @EnableBatchProcessing public class BatchConfiguration {
	 * 
	 * @Autowired public JobBuilderFactory jobBuilderFactory;
	 * 
	 * @Autowired public StepBuilderFactory stepBuilderFactory;
	 * 
	 * @Autowired public DataSource dataSource;
	 * 
	 * // tag::readerwriterprocessor[]
	 * 
	 * @Bean public void reader() { FlatFileItemReader<Integer> reader = new
	 * FlatFileItemReader<Integer>(); reader.setResource(new
	 * ClassPathResource("/reportData/err.txt")); // reader.set
	 * reader.setLineMapper(new DefaultLineMapper<InputStream>() {{
	 * setLineTokenizer(new DelimitedLineTokenizer() {{ setNames(new String[] {
	 * "firstName", "lastName" }); }}); setFieldSetMapper(new
	 * BeanWrapperFieldSetMapper<InputStream>() {{ setTargetType(InputStream.class);
	 * }}); }}); // return reader; }
	 * 
	 * @Bean public FtpUpload processor() { return new FtpUpload(); }
	 * 
	 * @Bean public JdbcBatchItemWriter<Integer> writer() {
	 * JdbcBatchItemWriter<Integer> writer = new JdbcBatchItemWriter<Integer>(); //
	 * writer.setItemSqlParameterSourceProvider(new
	 * BeanPropertyItemSqlParameterSourceProvider<InputStream>()); //writer.
	 * setSql("INSERT INTO people (first_name, last_name) VALUES (:firstName, :lastName)"
	 * ); // writer.setDataSource(dataSource); return writer; } //
	 * end::readerwriterprocessor[]
	 * 
	 * // tag::jobstep[]
	 * 
	 * @Bean public Job importUserJob(JobCompletionNotificationListener listener) {
	 * return jobBuilderFactory.get("importUserJob") .incrementer(new
	 * RunIdIncrementer()) .listener(listener) .flow(step1()) .end() .build(); }
	 * 
	 * @Bean public Step step1() { return stepBuilderFactory.get("step1") .<Integer,
	 * Integer> chunk(10) // .reader(reader()) .processor(processor()) //
	 * .writer(writer()) .build(); } // end::jobstep[] }
	 */

	/*
	 * \ ~YH~
	 */
}