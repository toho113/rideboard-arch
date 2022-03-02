# Rideboard-arch

Autoscaling ensures that your resources in the cloud are utilized efficiently and available when required. You can configure your cloud deployment to automatically adjust the compute resources based on performance metrics, such as CPU utilization. So your end users experience consistent performance even when the load is high. And your costs are proportionately low during periods of low demand.

This reference architecture shows a 3-tier topology consisting of a load balancer (LB), an autoscaling web tier, and a highly available database.

For details of the architecture, see [_Autoscale a load-balanced web application_](https://docs.oracle.com/en/solutions/autoscale-webapp/index.html)

## Prerequisites

- Permission to `manage` the following types of resources in your Oracle Cloud Infrastructure tenancy: `vcns`, `internet-gateways`, `route-tables`, `network-security-groups`, `subnets`, `autonomous-database-family`, and `instances`.

- Quota to create the following resources: 1 VCN, 2 subnets, 1 Internet Gateway, 1 NAT Gateway, 2 route rules, 1 LoadBalancer, 1 ATP database instance (+ optional standby), and 3 compute instances (plus max 2 more as a result of autoscaling).

If you don't have the required permissions and quota, contact your tenancy administrator. See [Policy Reference](https://docs.cloud.oracle.com/en-us/iaas/Content/Identity/Reference/policyreference.htm), [Service Limits](https://docs.cloud.oracle.com/en-us/iaas/Content/General/Concepts/servicelimits.htm), [Compartment Quotas](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/resourcequotas.htm).

## Architecture Diagram

![](./images/autoscaling.png)

