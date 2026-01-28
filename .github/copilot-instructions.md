# LISFLOOD Submodel Analysis Instructions

## Overview
This codebase analyzes LISFLOOD hydrological model outputs for submodel 7859. It focuses on post-processing time series (.tss) and spatial (NetCDF) data, comparing simulations with observations, and visualizing results.

## Key Components
- **Time Series Analysis**: Read LISFLOOD .tss files using `read_lisflood_tss()` function in `analyse_lf.ipynb`
- **Spatial Data**: NetCDF files in `maps/`, `out/`, `soilhyd/` for static inputs and model outputs
- **Observations**: CSV data in `station/` for validation
- **Visualization**: Jupyter notebooks with matplotlib and xarray plotting

## File Naming Conventions
- LISFLOOD outputs: `{varname}{run_name}.tss` (e.g., `dislong_term_run.tss`)
- NetCDF maps: `{var}_Global_03min.nc` or `{var}.nc`
- Run name derived from output directory name (e.g., `long_term_run`)

## Data Reading Patterns
- Use `pd.read_fwf()` for .tss files with `skiprows = 3 + n_gauges`
- Extract `n_gauges` from second line of discharge file
- Handle missing files by returning NaN DataFrames (see `read_lisflood_tss`)
- Use `xr.open_dataset()` for NetCDF files
- Convert units (e.g., upstream area to km²: `/= 1e6`)

## Plotting Conventions
- Spatial plots: `ds[var].plot.pcolormesh()` with gauge locations overlaid
- Time series: matplotlib subplots with `fig.autofmt_xdate()`
- Use `method="nearest"` for sampling at gauge coordinates
- Example: `dis["dis"].mean(dim="time").plot.pcolormesh(); gaugeloc.plot(ax=plt.gca(), color='red')`

## Dependencies and Libraries
- Core: pandas, xarray, numpy, matplotlib
- Spatial: geopandas, rioxarray
- Path handling: pathlib.Path

## Workflows
- Run notebooks in VS Code or Jupyter to analyze outputs
- Compare simulated vs observed discharge at gauge locations
- Validate water balance components (precip, runoff, evaporation)

## Common Patterns
- Start dates: "01/01/1975 00:00" for long-term runs
- Variable mappings: e.g., `eta` → `actEvapo`, `q` → `dis`
- Mask invalid values: `ds.where(ds > 0, np.nan)`
- Aggregate operations: `.mean(dim="time")` for temporal averages

## Key Files
- `analyse_lf.ipynb`: Main analysis notebook
- `maps/`: Static input maps (DEM, channels, soil properties)
- `out/`: Model outputs (discharge, soil moisture, evaporation)
- `station/observations.csv`: Observed discharge data