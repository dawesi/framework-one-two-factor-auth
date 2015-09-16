/**
*
* @file Application.cfc
* @author Denard Springle ( denard.springle@gmail.com )
* @description I am the webroot Application component for extending and configuring fw/1
*
*/

component extends="framework.one" {

	this.name = "two_factor_auth";
    this.applicationTimeout = CreateTimeSpan(0, 0, 0, 5);
    this.sessionManagement = true;
    this.sessionTimeout = CreateTimeSpan(0, 0, 30, 0); // 30 minutes
	this.datasource = 'twofactorauth';
	
	variables.framework = {
		usingSubsystems = true
	};

	/**
	* @displayname setupApplication
	* @description I'm run by fw/1 during onApplicationStart() to configure application level settings
	*/		
	function setupApplication() {
		// load the security functions for session management
		// NOTE: These keys should normally be stored in a secured file on the filesystem and read in by the application
		// NOTE: This could also be done using DI/AOP instead of loading it into the application scope
		application.securityService = createObject( 'component', 'model.services.SecurityService').init(
			encryptionKey1 			= '5rF57wTaM9PZtoGU5BzBFw==',
			encryptionAlgorithm1 	= 'BLOWFISH/CBC/PKCS5Padding',
			encryptionEncoding1 	= 'HEX',
			encryptionKey2 			= 'mPmp3lndQF9jhFbOAE9MMQ==',
			encryptionAlgorithm2 	= 'BLOWFISH/CBC/PKCS5Padding',
			encryptionEncoding2 	= 'HEX',
			encryptionKey3 			= 'QuPDlTHThkglDgBpz9gU+g==',
			encryptionAlgorithm3 	= 'AES/CBC/PKCS5Padding',
			encryptionEncoding3 	= 'HEX'
		);

		// set the name of the cookie to use for session management (*DO NOT USE* cfid, cftoken or jsessionid)
		application.cookieName = '__two_factor_auth_id';

		// set number of minutes before a session is timed out
		application.timeoutMinutes = 30; // 30 minutes

	}

	/**
	* @displayname setupSession
	* @description I'm run by fw/1 during onSessiontart() to configure session level settings
	*/	
	function setupSession() {

		// check if we're in the 'admin' subsystem
		if( getSubsystem()  eq 'admin' ) {
			// we are, call the security controller's session action to configure the session 
			controller( 'admin:security.session' );
		}

	}

	/**
	* @displayname setupRequest
	* @description I'm run by fw/1 during onRequestStart() to configure request level settings
	*/	
	function setupRequest() {

		// check if we're in the 'admin' subsystem
		if( getSubsystem()  eq 'admin' ) {
			// we are, call the security controller's authorize action to perform session management
			controller( 'admin:security.authorize' );			
		}

	}

}
