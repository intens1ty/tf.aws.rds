# Terraform AWS RDS postgres

## Functional
* Setup RDS postgres service
* Multi-AZ (2 available zones)
* Automatic Failover

## Usage

### 1. Clone this repo
```
git clone https://github.com/intens1ty/tf.aws.rds
```

### 2. Export credentials
```
export AWS_ACCESS_KEY_ID=()
export AWS_SECRET_ACCESS_KEY=()
```

### 3. Set up variables in variables.tf
* region
* vpc_id 
* vpc_cidr_block
* private_subnet
* availability_zone
* availability_zone_1
* availability_zone_2
* db_node_type
* password

### 4. Set up parameters in parameter.tf
All available parameters for RDS postgres see in AWS documentation

### 5. Start Terraform init
```
terrafotm init
```

### 6. Start Terraform plan
```
terrafotm plan
```

### 7. Start Terraform apply
```
terrafotm apply
```

### 7. (Optional) If you want to remove all this changes from aws - start destroy
```
terrafotm destroy
```