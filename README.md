# Creating a small AWS environment consisting of EC2, EIP, EBS, VPC and private subnet with Terraform

## Introduction

Another day at the office and another task from your colleagues. You have been asked to use Terraform in an AWS environment to create an EC2 instance.

## Problem Statement

The requirements are as follows:
* Create an EC2 instance with:  ++++++
    * type: `t2.micro`,
    * AMI: `ami-02f617729751b375a`,
    * Availability zone: `eu-west-2`.
* Create a VPC with:      +++++
    * CIDR block of `10.0.0.0/16`.
* Create a Subnet within that VPC with:  +++++
    * CIDR block of `10.0.10.0/24`,
    * Availability zone: `eu-west-2a`.
* Within your VPC, create an EIP with a `private` address of:  +++++++
    * `10.0.10.250`, ***
    * attach this Elastic IP to your instance.
* Create an EBS volume and attach it to the instance using:  ++++++++
    * device name `/dev/sdc`,
    * Availability zone: `eu-west-2a`. ***
* Important: when it is possible, please use the `availability_zone` = `eu-west-2`. ***   ++++++
* Your code does not use any existing modules and is only composed of plain resources provided by the official AWS Terraform provider.

