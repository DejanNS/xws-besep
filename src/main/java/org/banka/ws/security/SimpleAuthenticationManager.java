package org.banka.ws.security;

import java.security.cert.X509Certificate;

import javax.security.auth.x500.X500Principal;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;

public class SimpleAuthenticationManager implements AuthenticationManager {

	Logger logger = LoggerFactory.getLogger(getClass());

	@Override
	public Authentication authenticate(Authentication authentication)
			throws AuthenticationException {

		Object credentials = authentication.getCredentials();

		if (X509Certificate.class.isAssignableFrom(credentials.getClass())) {

			X509Certificate certificate = (X509Certificate) credentials;

			// do some custom authentication here
			setupRightsBasedOn(certificate);
		}

		authentication.setAuthenticated(true);

		return authentication;
	}

	private void setupRightsBasedOn(X509Certificate certificate) {

		X500Principal subjectX500Principal = certificate
				.getSubjectX500Principal();
		logger.info("----------------------->{}",
				subjectX500Principal.getName());
		// Rights rights =
		// rightsFor(commonNameFrom(subjectX500Principal.getName()));

		// SecurityContext.initContext(rights);
	}

	// private String commonNameFrom(String subjectName) {
	// return StringUtils.extractNesting(subjectName, "CN=", ",",
	// EXCLUDE_OPEN_BRACE_IN_NESTING, EXCLUDE_CLOSING_BRACE_IN_NESTING);
	// }
}
