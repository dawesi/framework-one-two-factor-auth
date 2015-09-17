# FW/1 Two-Factor Authentication Example

This project is an example fw/1 application with two-factor authentication and session management functions as follows:

* Based on basic example fw/1 application
* Uses subsystems for separation of concerns, securing only the 'admin' subsystem
* Includes a SecurityService component that has encryption, decryption, hashing, password generation and session management code
* Includes a security controller for managing session and request scope session management within the 'admin' subsystem
* Uses cookies and object cache for session management
* Rotates the session id on each request to help prevent CSRF
* Federates the login with a cookie and referrer requirement
* Protects the users password from disclosure with SHA-384 encryption during login
* Stores user data in encrypted format in the database
* Default CBC/PKCS5Padding defined for encryption algorithms
* Adds second factor authentication using email to text - sends code to the users phone

This code was put together for the `ColdFusion: Code Security Best Practices` presentation by Denard Springle at [NCDevCon 2015](http://www.ncdevcon.com) and is a good basic base starting point if you need to create a secure two-factor application using fw/1.

## Installing

1. Drop the code into your favorite CFML engine's webroot
2. Create a database and generate the users and smsProviders database tables (MSSQL SQL and Excel data provided in the 'database' folder)
3. Create a datasource for your database in your CFML engine's admin
4. Configure an object cache, if one is not already defined (Railo/Lucee)
5. Modify encryption keys/algorithms/encoding in Application.cfc (use http://www.dvdmenubacks.com/key.cfm to generate keys)
6. Modify cookieName and timeoutSession variables in Application.cfc
7. Browse to webroot and enjoy!

## Demo

You can view this code live at https://tfa.vsgcom.net/

## Bugs and Feature Requests

If you find any bugs or have a feature you'd like to see implemented in this code, please use the issues area here on GitHub to log them.

## Contributing

This project is actively being maintained and monitored by Denard Springle. If you would like to contribute to this example please feel free to fork, modify and send a pull request!
