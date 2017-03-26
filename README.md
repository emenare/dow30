# dow30
Retrieve and display DOW 30 stocks in a webpage.

##Built on 
Red Hat Enterprise Linux Server release 7.3 (Maipo)

## Run with
ansible 2.2.1.0

##Requirements
hosts configured with passwordless ssh

##Instructions
Alter the hosts file to include the addresses of your 3 hosts
Run full_stack.yml

##Notes


##Improvements
- Format out the curled data into separate fields for the mysql db.
- Use synchronize method to copy directly between mysqlserver and webserver
- Dockerize everything
- Terraform it all so there are new hosts with each run.
- File clean up
- Handlers (retries + failures)
