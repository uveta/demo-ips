call az login
call az account set --subscription "Uros2 VS Enterprise Subscription"
@REM call az deployment sub create --name dep-bicep-demo-rg --location westeurope --template-file resourceGroup.bicep
call az deployment sub create --name dep-bicep-demo-rg --location westeurope --template-file v1_resourceGroup.bicep
call az deployment group create --name dep-bicep-demo-sto -g rg-bicep-demo --template-file v1_storageAccount.bicep

call az deployment sub create --name dep-bicep-demo-rg --location westeurope --template-file v2_resourceGroup.bicep --parameters location=westeurope
call az deployment group create --name dep-bicep-demo-sto -g rg-bicep-demo --template-file v2_storageAccount.bicep --parameters location=westeurope sku=Standard_GRS

call az deployment sub create --name dep-bicep-demo-rg --location westeurope --template-file v3_resourceGroup.bicep --parameters location=westeurope

call az deployment sub create --name dep-bicep-demo-rg --location westeurope --template-file v4_resourceGroup.bicep --parameters location=westeurope deployStorage=true
