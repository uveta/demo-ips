call az login
call az account set --subscription "Uros2 VS Enterprise Subscription"
call az deployment sub create --name dep-bicep-demo-rg --location westeurope --template-file resourceGroup.bicep
call az deployment group create --name dep-bicep-demo-sto -g rg-bicep-demo --template-file storageAccount.bicep