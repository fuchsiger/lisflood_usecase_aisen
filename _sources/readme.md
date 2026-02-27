![EU Banner](images/eu_banner.png)

LISFLOOD is a spatially distributed, semi-physical hydrological rainfall-runoff model that has been developed by the Joint Research Centre (JRC) of the European Commission in late 90ies. Since then LISFLOOD has been applied to a wide range of applications such as all kind of water resourses assessments looking at e.g. the effects of climate and land-use change as well as river regulation measures. Its most prominent application is probably within the [European Flood Awareness System](https://www.efas.eu/) (EFAS) operated under [Copernicus Emergency Management Service](https://emergency.copernicus.eu/) (EMS).

It’s wide applicability is due to its modular structure as well as its temporal and spatial flexibility. The model can be extended with additional modules when need arises, to satisfy the new target objective. In that sense it can be extended to include anything from a better representation of a particular hydrological flow to the implementation of anthropogenic-influenced processes. At the same time the model has been designed to be applied across a wide range of spatial and temporal scales. LISFLOOD is grid-based, and the EFAS (Europe) and GloFAS (Globe) applications have employed grid cells of 1 arcmin and 3 arcmin, respectively. Long-term water balance can be simulated (e.g., daily time step), as well as individual flood events (using hourly time intervals, or even smaller).

All output can be written as grids, or time series at user-defined points or areas. The user has complete control over how output is written, thus minimising any waste of disk space or CPU time. Regardless of its deployment in the operational flood forecast, LISFLOOD can be used to provide all kind of hydrological rate and state variables, such as ET, snowmelt, snow water equivalent or soil moisture. 

Go to [Lisflood OS page](https://ec-jrc.github.io/lisflood/) for more information. Other useful resources:

| **Project** | **Documentation** | **Source code** |
| :--- | :--- | :--- |
| Lisflood | [Model docs](https://ec-jrc.github.io/lisflood-model/) | https://github.com/ec-jrc/lisflood-code (this repository) |
| | [User guide](https://ec-jrc.github.io/lisflood-code/) | |
| Lisvap | [Docs](https://ec-jrc.github.io/lisflood-lisvap/) | https://github.com/ec-jrc/lisflood-lisvap |
| Calibration tool | [Docs](https://ec-jrc.github.io/lisflood-calibration/) | https://github.com/ec-jrc/lisflood-calibration |
| Lisflood Utilities | | https://github.com/ec-jrc/lisflood-utilities |
| Lisflood Usecases | | https://github.com/ec-jrc/lisflood-usecases |

# **LISFLOOD Use Case - Río Aisén, West Patagonia, Chile**

This use case intends to introduce the basic mechanics of the hydrological model [LISFLOOD](https://github.com/ec-jrc/lisflood-code/).<br>
The example will guide users through a set of exercises structured in X jupyter notebooks and focus from preprocessing and model setup to calibration.<br>
The notebooks are structured as followed:

1. **Catchment Characteristics** (*0_Catchment.ipynb*)
2. **Preprocessing** (*1_Preprocess.ipynb*)
3. **Initialization**
   1. Model Initialization (*2_Initialization.ipynb*)
   2. Excursus: Initialization Details (*Excursos_Initialization.ipynb*)
4. **Model Run** (*3_Run.ipynb*)
5. **Calibration (simple)** (*4_Calibration_MC.ipynb*)

<br>
The test basin of the use case is located in Chile, more precisely in western Patagonia and serves as an untouched river basin particularly suitable to explore the basic functionalities and opportunities of LISFLOOD. The river under investigation is the Rio Aisén that originates from the two headwater streams Río Mañihuales and Río Simpson and has a basin size of around 11,400 km². The river terminates in Puerto Aisén and has a pluvial flow regime with minor glaciological and nival features. Elevation in the catchment goes up to more than 2,000 m. <br>
A map of the basin is shown below.<br> 

![Study Area](images/usecase_map.png)

# **LISFLOOD Processes**

We encourage users to explore in detail the process representations of LISFLOOD, e.g. an introduction can be found [here](https://ec-jrc.github.io/lisflood-model/2_01_stdLISFLOOD_overview/).<br>
In the following a quick overview scheme is provided that gives a first overview of the processes modeled by LISFLOOD:

![LISFLOOD Processes](images/lisflood_scheme.png)

<br>
In more detail, we provide a quick wrap up on the process representations in LISFLOOD:
<br>
<br>

| Process | Model representation | Notes | Main calibration parameters |
|--------|----------------------|------------------------|-----------------|
| Potential Evapotranspiration | Penman-Monteith | Climatic input (e.g. computed by LISVAP) | — |
| Runoff Generation / Infiltration | Xinanjiang-type (VIC / ARNO) | Non-linear soil moisture distribution linking potential infiltration capacity to soil moisture | *b_Xinanjiang* (Shape parameter) |
| Snow Melt | Degree-day Approach | Rain-on-snow impacts included; Melt-factor is seasonally varying; snow fall and melt threshold temp. set to 1°C | *SnowMeltCoef* (Degree-day factor) |
| Soil Moisture Redistribution | Iterative vertical redistribution based on soil moisture gradients | Uses conceptual Darcy/van Genuchten relationships to define potential fluxes | - |
| Preferential (Bypass) Flow | Power Function of Relative Saturation | Preferential flow water is limited by available infiltration water | *PowerPrefFlow* (shape parameter) |
| Groundwater | Lower & Upper Zone Linear Reservoirs | Upper reservoir acts as fast and Lower reservoir as slowe responding components; Percolation between both reservoirs considered; Groundwater loss outside the catchment from Lower zone possible | *GwPercValue* (Max. percolation between layers) <br> *LowerZoneTimeConstant* (Recession constant upper zone) <br> *UpperZoneTimeConstant* (Recession constant lower zone) <br> *GwLoss* (Max. loss lower layer) |
| Surface Runoff Routing | Kinematic Wave | 4-point implicit finite-difference solution; momentum simplified (S0 = Sf) | — |
| Surface Runoff Routing | Kinematic Wave | 4-point implicit finite-difference solution; momentum simplified (S0 = Sf) | — |










