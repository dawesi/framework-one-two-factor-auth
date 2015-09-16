<cfparam name="rc.msg" default="">
	<div class="row">
		<div class="col-md-12"><h1>Two-Factor Auth Example</h1></div>
	</div>
	<div class="row">
		<div class="col-md-12">&nbsp;</div>
	</div>
	<div class="row">
		<div class="col-md-4">
			<cfif len( rc.msg )>
				<cfif !find( left( rc.msg, 3), '200')>
	                <div class="alert alert-danger alert-dismissable">
	                    <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
	                    <i class="fa fa-exclamation-triangle"></i> <cfoutput>#urlDecode( rc.msg )#</cfoutput>
	                </div>
                <cfelse>
	                <div class="alert alert-success alert-dismissable">
	                    <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
	                    <i class="fa fa-info-circle"></i> <cfoutput>#urlDecode( rc.msg )#</cfoutput>
	                </div>
                </cfif>
			</cfif>
			<div class="panel panel-info">
				<div class="panel-heading">
					<h3 class="panel-title">
						Register for a Two-Factor Auth account
					</h3>
				</div>
				<div class="panel-body">					
					<cfoutput><form role="form" action="#buildUrl( 'main.process' )#" method="POST"></cfoutput>
						<div class="form-group">							 
							<label for="username">
								Email address
							</label>
							<input type="email" class="form-control" name="username" id="username" placeholder="someone@somewhere.com" required>
						</div>
						<div class="form-group">							 
							<label for="password">
								Password
							</label>
							<input type="password" class="form-control" name="password" id="password" placeholder="mY$7r0NGP@s$W0rD" required>
						</div>
						<div class="form-group">							 
							<label for="confirm">
								Confirm Password
							</label>
							<input type="password" class="form-control" name="confirm" id="confirm" placeholder="mY$7r0NGP@s$W0rD" required>
						</div>
						<div class="form=group">
							&nbsp;
						</div>
						<div class="form-group">							 
							<label for="firstName">
								First Name
							</label>
							<input type="text" class="form-control" name="firstName" id="firstName" placeholder="John" required>
						</div>
						<div class="form-group">							 
							<label for="lastName">
								Last Name
							</label>
							<input type="text" class="form-control" name="lastName" id="lastName" placeholder="Smith" required>
						</div>
						<div class="form=group">
							&nbsp;
						</div>
						<div class="form-group">							 
							<label for="phone">
								Phone Number
							</label>
							<input type="text" class="form-control" name="phone" id="phone" placeholder="9999999999" required>
						</div>
						<div class="form-group">							 
							<label for="providerId">
								Phone Carrier
							</label>
							<select name="providerId" class="form-control" required>
								<option value="">--== Choose your carrier ==--</option>
								<cfoutput query="rc.qGetSmsProviders">
									<option value="#rc.qGetSmsProviders.providerId#">#rc.qGetSmsProviders.provider#</option>									
								</cfoutput>
							</select>
						</div>
						<button type="submit" class="btn btn-success">
							Register
						</button>
						&nbsp;&nbsp;
						<cfoutput><a href="#buildUrl( 'main.default' )#" class="btn btn-danger">Cancel</a></cfoutput>
					</form>
				</div>
				<div class="panel-footer">
					Already have an account? <cfoutput><a href="#buildURL( 'admin:main.default' )#">Login Now!</a></cfoutput>
				</div>
			</div>
		</div>
		<div class="col-md-8">
		</div>
	</div>