<img src="./images/eu_banner.png" alt="EU Banner" width="100%"/>

<br>

# **LISFLOOD Use Case - Río Aisén, West Patagonia, Chile**

This use case intends to introduce the basic mechanics of the hydrological model [LISFLOOD](https://github.com/ec-jrc/lisflood-code/).<br>
The example will guide users through a set of exercises structured in X jupyter notebooks and focus from preprocessing and model setup to calibration.<br>
The notebooks are structured as followed:
1) Preprocessing (*1_Preprocess.ipynb*): 
2)
3) 
4)
5)

<br>
The test basin of the use case is located in Chile, more precisely in western Patagonia and serves as an untouched river basin particularly suitable to explore the basic functionalities and opportunities of LISFLOOD. The river under investigation is the Rio Aisén that originates from the two headwater streams Río Mañihuales and Río Simpson and has a basin size of around 11,400 km². The river terminates in Puerto Aisén and has a pluvial flow regime with minor glaciological and nival features. Elevation in the catchment goes up to more than 2,000 m. <br>
A map of the basin is shown below.<br> 

<img src="images/usecase_map.png" alt="Use Case Map" style="width:50%;"/>


# **LISFLOOD Processes**

We encourage users to explore in detail the process representations of LISFLOOD, e.g. an introduction can be found [here](https://ec-jrc.github.io/lisflood-model/2_01_stdLISFLOOD_overview/).<br>
In the following a quick overview scheme is provided that gives a first overview of the processes modeled by LISFLOOD:

<img src="images/lisflood_scheme.png" alt="Use Case Map" style="width:50%;"/>

<br>
In more detail, we provide a quick wrap up on the process representations in LISFLOOD:

| Process | Model representation | Notes | Main calibration parameters |
|--------|----------------------|------------------------|-----------------|
| Potential Evapotranspiration | Penman-Monteith | Climatic input (e.g. computed by LISVAP) | — |
| Runoff Generation / Infiltration | Xinanjiang-type (VIC / ARNO) | Non-linear soil moisture distribution linking potential infiltration capacity to soil moisture | *b_Xinanjiang* (Shape parameter) |
| Snow Melt | Degree-day Approach | Rain-on-snow impacts included; Melt-factor is seasonally varying; snow fall and melt threshold temp. set to 1°C | *SnowMeltCoef* (Degree-day factor) |
| Soil Moisture Redistribution | Iterative vertical redistribution based on soil moisture gradients | Uses conceptual Darcy/van Genuchten relationships to define potential fluxes | - |
| Preferential (Bypass) Flow | Power Function of Relative Saturation | Preferential flow water is limited by available infiltration water | *PowerPrefFlow* (shape parameter) |
| Groundwater | Lower & Upper Zone Linear Reservoirs | Upper reservoir acts as fast and Lower reservoir as slowe responding components; Percolation between both reservoirs considered; Groundwater loss outside the catchment from Lower zone possible | *GwPercValue* (Max. percolation between layers) <br> *LowerZoneTimeConstant* (Recession constant upper zone) <br> *UpperZoneTimeConstant* (Recession constant lower zone) <br> *GwLoss* (Max. loss lower layer) |
| Surface Runoff Routing | Kinematic Wave | 4-point implicit finite-difference solution; momentum simplified (S0 = Sf) | — |









