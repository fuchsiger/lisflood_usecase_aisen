[![Jupyter Book](https://img.shields.io/badge/powered--by-Jupyter%20Book-orange)](https://fuchsiger.github.io/lisflood_usecase_aisen)

# Lisflood use case: Río Aisén, West Patagonia, Chile

This repository hosts a use case for the LISFLOOD model (v5 - used for GloFASv5 and EFASv6). The purpose of this use case is to provide a practical example of setting up and running LISFLOOD for a natural catchment in South America, specifically the Río Aisén in Chile. The use case includes all the static input maps, meteorological forcings, and LISFLOOD setting files needed to run the simulation.</br>
The [model documentation](https://ec-jrc.github.io/lisflood-model/) provides a detailed description of the modelling of the hydrological processes; the [user guide](https://ec-jrc.github.io/lisflood-code/) provides the guidelines for the set-up of a simulation.</br>
And the detailed use case documentation (this repo), which is recommend to check, can be accessed [here](https://fuchsiger.github.io/lisflood_usecase_aisen).


**NOTE about the static maps made available by this repository**: all the static maps of the Río Aisén catchment were produced following the [updated protocol](https://ec-jrc.github.io/lisflood-code/4_Static-Maps-introduction/) for the preparation of static maps. This protocol relies on the most recent (up to 2021) research findings and data sets (both remote sensing data sets and in-situ measurements).

Moreover, a set of Jupyter Notebooks has been developed to guide users through the entire workflow from preprocessing to calibration. A description of the notebooks is provided [below](#jupyter-notebooks).

## Running LISFLOOD-OS on your PC

### Use case: Río Aisén, West Patagonia, Chile <a id="usecase1"></a>

#### Short description 
The Río Aisén use case is located in the Aysén Region of Chile, in western Patagonia. The Río Aisén originates from the two headwater streams Río Mañihuales and Río Simpson and flows through the city of Puerto Aisén before discharging into the Pacific Ocean. The basin size is approximately 11,400 km², with elevation ranging from sea level to over 2,000 meters. The river has a mixed (pluvio-nival) regime with minor glaciological features. It has a seasonality and the mean flow at the outlet in the period 1996 - 2018 was around 530 m3/s. Moreover, the catchment is water-rich and counts as an energy-limited regime, something we will explore further in the Use Case. Precipitation has a strong East-West gradient with highest annual precipitation sums in the Western coastal areas, where values can reach around 4,000 mm/a, while the basin average was around 1,300 mm/a for the same 1996 to 2018 period. Average annual temperatures are cold and vary between 2.5 and 4.5 °C with an increase in temperatures since the 2000s. Mean monthly basin-wide mean temperatures stay usually below 8 °C, however, in the coastal valley part of course temperatures are significantly higher. Precipitation mainly falls in Winter (note as we are on the Southern Hemisphere this coincides with the Northern Hemisphere Summer) and overall the cold-wet climate of the basin counts as cool oceanic climate (Cfb in the Köppen-Geiger climate classification).

![LISFLOOD Processes](images/usecase_map.png)

This use case is derived from the global LISFLOOD setup of GloFAS. The input maps cover the entire Río Aisén catchment with the outlet located at Puerto Aisén. The catchment represents an untouched river basin in western Patagonia, making it particularly suitable for exploring the basic functionalities of LISFLOOD.

As this is a use case from the global GloFAS setup, all input maps are in the geographical system WGS84, with latitude and longitude. The map extent covers the Aysén Region in Chile, with a horizontal resolution of 0.03 degrees (approximately 3 km). The standard map format is netCDF.

#### How to get it running (Quick Start)

Before getting started, let's have a look at the inventory of files belonging to the Río Aisén use case:
- [Two main pre-edited LISFLOOD settings files](settings/):
  - *Settings_PreRun.xml* for the warm-up, i.e., initialization of the hydrological model
  - *Settings_Run.xml* for the actual simulation
- [Folder: *maps*](maps/) includes the static maps of the Río Aisén catchment, with information on soil, topography, channel geometry, land use, etc.
- [Folder: *meteo*](meteo/) contains all the meteorological input data, such as daily precipitation and temperature from 1975 till 2024
- [Folder: *inflow*](inflow/) contains the inflow boundary conditions (if applicable)
- [Folder: *initial*](initial/) contains initial conditions for the model runs
- [Folder: *tables*](tables/) contains information on lakes and reservoirs
- [Folder: *settings*](settings/) contains the LISFLOOD configuration files
- [Folder: *out*](out/) contains the outputs of your runs
- [Folder: *station*](station/) contains the station data (metadata & discharge observations) at the outlet used for GloFAS calibration

To make everything work properly, you can also use the *environment.yml* file to create an environment with all the libraries needed in this tutorial.</br>
The following steps refer to a quick start, however, the comprehensive tutorial can be found under [*docs*](docs/).</br>
For general information on LISFLOOD input files see [here](https://ec-jrc.github.io/lisflood-code/4_annex_input-files/).

Okay let's get started. Follow the steps below to execute the use case on your PC: 
1. If you haven't installed LISFLOOD yet (and don't use our *.yml*), please do that first. You find the model [here](https://github.com/ec-jrc/lisflood-code) and also the [installation instructions](https://ec-jrc.github.io/lisflood-code/3_step2_installation/). Note: if possible, please install it on a LINUX system as it has shown to work more reliably on that system and as we do not provide support for Windows. 
2. Once you have completed step 1, download all the files belonging to the Río Aisén use case to your local drive, please keep the folder structure as it is in the repository as LISFLOOD will expect them like that in our examples. 
3. In general the paths in the setting files should be relative paths and thus work universally, however, please double check and on demand adapt the path names (so they fit your local drives): *PathRoot*, *MaskMap*, *PathRoot*, *PathParams*, and *PathTables*. Please remember to do that for all settings files as else you will run into problems very soon (In fact the paths are one of the most recurring mistakes).
TIP: You can use *$(ProjectDir)* or *$(ProjectPath)* as built-in variable to use in this XML settings, to refer to the project folder.
4. Make sure you have a folder called *out* in the same parent folder on your local drive, to provide LISFLOOD with a designated space to save your model output.
5. Open a command window and execute LISFLOOD. First you have to do the pre-run to initialize the model, for that you have to execute LISFLOOD with the following settings file: *Settings_PreRun.xml*. Once that is completed, check the *out* folder, you should find a file called *lzavin* in there. The file should also be located in the *initial* folder, so you can use the one that already exists there or replace it with the one you created. If that's the case you can launch the actual LISFLOOD run by executing LISFLOOD with the *Settings_Run.xml* settings file. This should produce a file called *dis.tss* in your *out* folder. The *dis.tss* contains the simulated discharge at the outlet point at Puerto Aisén.
6. Compare your output with the expected results, e.g. the observations located in *station*, to verify the correct installation and running of LISFLOOD.

#### Additional Settings Files

This use case includes several additional settings files for different purposes:
- *Settings_Run_short_init.xml* and *Settings_PreRun_short_init.xml*: Short initialization demo run
- *Settings_Run_Calib.xml* and *Settings_PreRun_Calib.xml*: Settings for calibration runs

### What's next? <a id="next"></a>

If everything went alright you can be sure that LISFLOOD runs correctly on your PC and you are ready to set it up for your own area. By the number of input maps you can tell that this is not going to be an easy exercise as LISFLOOD is quite complex and requires several input information. By making available this use case we hope to facilitate you to understand how LISFLOOD works and what input information it requires. We recommend you to read carefully the documentation on the input data, so that you can prepare them for your own area. As a good practice we recommend you to replace one map at a time and see if LISFLOOD is still running as that will help you to understand where things went wrong in the case that the model has stopped working.

## Jupyter Notebooks <a id="jupyter-notebooks"></a>

A set of Jupyter Notebooks was developed to guide users through the entire LISFLOOD workflow. They allow the user to familiarize with LISFLOOD settings, parameters, processing protocol, and output variables.

The notebooks are structured as follows:

1. **Catchment Characteristics** (*docs/0_Catchment.ipynb*)
   - Overview of the Río Aisén catchment
   - Basin characteristics and hydrological features

2. **Preprocessing** (*docs/1_Preprocess.ipynb*)
   - Data preparation for LISFLOOD
   - Map generation and manipulation

3. **Initialization**
   - Model Initialization (*docs/2_Initialization.ipynb*)
   - Excursus: Initialization Details (*docs/Excursus_Initialization.ipynb*)
   - Setting up initial conditions for the hydrological model

4. **Model Run** (*docs/3_Run.ipynb*)
   - Running the LISFLOOD simulation
   - Understanding output files

5. **Calibration (Monte Carlo)** (*docs/4_Calibration_MC.ipynb*)
   - Parameter calibration using Monte Carlo approach
   - Sensitivity analysis


*Note*: *The users are recommended to test the functioning of the Jupyter notebook by running the Río Aisén use case.*

## LISFLOOD Processes

We encourage users to explore in detail the process representations of LISFLOOD, e.g. an introduction can be found [here](https://ec-jrc.github.io/lisflood-model/2_01_stdLISFLOOD_overview/). In the following a quick overview scheme is provided that gives a first overview of the processes modeled by LISFLOOD:

![LISFLOOD Processes](docs/images/lisflood_scheme.png)

In more detail, we provide a quick wrap up on the process representations in LISFLOOD:

| Process | Model representation | Notes | Main calibration parameters |
|--------|----------------------|------------------------|-----------------|
| Potential Evapotranspiration | Penman-Monteith | Climatic input (e.g. computed by LISVAP) | — |
| Runoff Generation / Infiltration | Xinanjiang-type (VIC / ARNO) | Non-linear soil moisture distribution linking potential infiltration capacity to soil moisture | *b_Xinanjiang* (Shape parameter) |
| Snow Melt | Degree-day Approach | Rain-on-snow impacts included; Melt-factor is seasonally varying; snow fall and melt threshold temp. set to 1°C | *SnowMeltCoef* (Degree-day factor) |
| Soil Moisture Redistribution | Iterative vertical redistribution based on soil moisture gradients | Uses conceptual Darcy/van Genuchten relationships to define potential fluxes | - |
| Preferential (Bypass) Flow | Power Function of Relative Saturation | Preferential flow water is limited by available infiltration water | *PowerPrefFlow* (shape parameter) |
| Groundwater | Lower & Upper Zone Linear Reservoirs | Upper reservoir acts as fast and Lower reservoir as slow responding components; Percolation between both reservoirs considered; Groundwater loss outside the catchment from Lower zone possible | *GwPercValue* (Max. percolation between layers) <br> *LowerZoneTimeConstant* (Recession constant lower zone) <br> *UpperZoneTimeConstant* (Recession constant upper zone) <br> *GwLoss* (max. loss lower layer) <br> *LZThreshold* (Threshold below which no baseflow occurs) |
| Surface Runoff Routing | Kinematic Wave | 4-point implicit finite-difference solution; momentum simplified (S0 = Sf) | — |
| Sub-surface Routing | Kinematic Wave | Refers only to LZ & UZ (groundwater) water **not** soil water; chanell pixel assigned via drainage network | — |
| Channel Routing | Kinematic Wave or Muskingum-Cunge-Todini (MCT) | Kinematic wave for higher slopes and for flat areas MCT; Pixels are assigned beforehand to what routing method is used; 4-point implicit finite-difference solution | *CalChanMan1* <br> *CalChanMan3* |

## Acknowledgements

This use case is based on the global LISFLOOD setup developed for the GloFAS (Global Flood Awareness System) system operated by the European Commission Joint Research Centre.
