
## Queston: 1.How to create Kubernetes resources from 100s of YAML files all at once
***
<details>
<summary>Answer:</summary> 
kubectl apply command takes directory as an argument. This allows us to create as many resources as we like all at once.

```
kubectl apply -f ./demo/ 
```
</details>

***
***

