---
name: domain-gis
domain: computer-vision
description: Activate when writing or reviewing sections involving GIS, remote sensing, UAV imagery, spatial resolution, or land cover mapping — injects GIS terminology, sensor specifications, GSD formulas, CRS standards, and data acquisition documentation requirements.
version: 2.0.0
allowed-tools: Read,Glob
---

# Domain: Geospatial and Remote Sensing

Domain expertise for remote sensing and GIS research sections. Targets: Remote Sensing, IEEE TGRS, ISPRS Journal.

---

## Overview

**Invoke when**: writing about image acquisition, sensor specs, GSD, georeferencing, or spatial analysis.
**Pair with**: research-writer (drafting) or research-reviewer (critique).

---

## Section 1 — Spatial Resolution Terminology

| Term | Precise Definition |
|------|-------------------|
| GSD | Ground Sample Distance — physical size of one pixel (cm/px or m/px) |
| Orthorectification | Geometric correction removing terrain distortion |
| Orthomosaic | Geometrically corrected, mosaicked aerial image |
| DSM | Digital Surface Model — elevation including objects |
| DEM/DTM | Digital Elevation/Terrain Model — bare earth elevation |
| Nadir | Camera pointing directly down over target |
| Radiometric Correction | Normalizing pixel values for sensor/illumination variation |
| Atmospheric Correction | Removing scattering effects to obtain surface reflectance |
| UAV | Unmanned Aerial Vehicle — the aircraft platform |
| AGL | Above Ground Level — flight altitude reference |
| GCP | Ground Control Point — surveyed reference for georeferencing |
| RTK | Real-Time Kinematic GPS — centimeter-level positioning |
| Overlap | Forward/side image overlap (typical: 80%/70%) |
| RGB Sensor | Standard visible-spectrum camera (Red, Green, Blue) |
| Multispectral | Captures 4-10 bands including NIR |

---

## Section 2 — GSD Formula

GSD = (H * s) / f

H = flight altitude (m AGL), s = sensor pixel size (mm), f = focal length (mm)

Example: 50m AGL, 3.6mm pixel, 8.8mm focal -> GSD = 2.05 cm/px

---

## Section 3 — Satellite Sensor Reference

| Sensor | Resolution | Revisit | Access |
|--------|-----------|---------|--------|
| Sentinel-2 | 10 m/px | 5 days | Free |
| Landsat-8/9 | 30 m/px | 16 days | Free |
| Planet Scope | 3-5 m/px | Daily | Commercial |
| WorldView-3 | 0.3 m/px | 1 day | Commercial |
| DJI Phantom 4 Pro | 2-5 cm/px @50m | On-demand | Own |

---

## Section 4 — Vegetation Indices

| Index | Formula | Application |
|-------|---------|-------------|
| NDVI | (NIR-Red)/(NIR+Red) | Vegetation health |
| EVI | 2.5*(NIR-Red)/(NIR+6*Red-7.5*Blue+1) | Reduces noise |
| NDRE | (NIR-RedEdge)/(NIR+RedEdge) | Crop stress |

---

## Section 5 — Data Acquisition Checklist (Chapter 3)

- [ ] Platform type and model
- [ ] Sensor: resolution, bands, FOV
- [ ] Flight altitude AGL
- [ ] GSD achieved (calculated)
- [ ] Acquisition date(s) and season
- [ ] Weather conditions (cloud cover %, wind speed)
- [ ] Geographic coordinates / study area extent (ha or km2)
- [ ] CRS / EPSG code
- [ ] Preprocessing steps (orthorectification, atmospheric correction)
- [ ] Software used (Agisoft Metashape, QGIS, etc.)

---

## Section 6 — Study Area Template

"The study area is located in [Province, Country] ([lat]N-[lat]N, [lon]E-[lon]E),
encompassing approximately [X] ha of [land cover type]. The terrain is [flat/hilly]
with elevation [X]-[Y] m MASL."

---

## Section 7 — Canonical References

- Nex, F., & Remondino, F. (2014). UAV for 3D mapping. Applied Geomatics, 6(1), 1-15.
- Drusch, M., et al. (2012). Sentinel-2. Remote Sensing of Environment, 120, 25-36.
- Cheng, G., et al. (2020). Remote sensing scene classification. ISPRS Journal, 145, 102001.

---

## Section 8 — Forbidden Phrases

| Forbidden | Correct |
|-----------|---------|
| "high-resolution image" | "imagery with GSD of X cm/px" |
| "satellite photo" | "multispectral imagery (Sentinel-2, 10 m/px)" |
| "GPS coordinates" | "geographic coordinates (WGS 84, EPSG:4326)" |
| "the drone flew over" | "UAV imagery was acquired at X m AGL" |

---

## Error Handling

GSD not specified:
-> Flag: "[GSD NOT SPECIFIED — required for all UAV/RS sections]"

CRS absent:
-> Flag: "[CRS NOT SPECIFIED — add EPSG code to Methods section]"
