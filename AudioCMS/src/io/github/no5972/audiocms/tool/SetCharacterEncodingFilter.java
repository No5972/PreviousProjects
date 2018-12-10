package io.github.no5972.audiocms.tool;

import java.io.IOException;
import java.util.Map;
import java.util.Set;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

public class SetCharacterEncodingFilter implements Filter {

	// ----------------------------------------------------- Instance Variables

	protected String encoding = null;

	protected FilterConfig filterConfig = null;

	protected boolean ignore = true;

	// --------------------------------------------------------- Public Methods

	public void destroy() {

		this.encoding = null;
		this.filterConfig = null;

	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {

		// debug
		// System.out.println("OH YEYEYE");

		// Conditionally select and set the character encoding to be used
		if (ignore || (request.getCharacterEncoding() == null)) {
			String encoding = selectEncoding(request);
			if (encoding != null)
				request.setCharacterEncoding(encoding);
		}

		// process get parameters
		HttpServletRequest httpRequest = (HttpServletRequest) request;
		Map paramMap = request.getParameterMap();
		String[] queryStringArray = { "" };
		if (httpRequest.getQueryString() != null) {
			queryStringArray = httpRequest.getQueryString().split("&");
		}
		for (int i = 0; i < queryStringArray.length; i++) {
			queryStringArray[i] = queryStringArray[i].replaceAll("(.*)=(.*)", "$1");
		}
		Set<String> keySet = paramMap.keySet();
		for (String key : keySet) {
			// check where param from
			boolean isFromGet = false;
			for (String paramFromGet : queryStringArray) {
				if (key.equals(paramFromGet)) {
					isFromGet = true;
				}
			}
			if (!isFromGet) {
				continue;
			}
			String[] paramArray = (String[]) paramMap.get(key);
			for (int i = 0; i < paramArray.length; i++) {
				paramArray[i] = new String(paramArray[i].getBytes("iso-8859-1"), encoding);
			}
		}

		// Pass control on to the next filter
		chain.doFilter(request, response);

	}

	public void init(FilterConfig filterConfig) throws ServletException {

		this.filterConfig = filterConfig;
		this.encoding = filterConfig.getInitParameter("encoding");
		String value = filterConfig.getInitParameter("ignore");
		if (value == null)
			this.ignore = true;
		else if (value.equalsIgnoreCase("true"))
			this.ignore = true;
		else if (value.equalsIgnoreCase("yes"))
			this.ignore = true;
		else
			this.ignore = false;

	}

	// ------------------------------------------------------ Protected Methods

	protected String selectEncoding(ServletRequest request) {

		return (this.encoding);

	}

}
