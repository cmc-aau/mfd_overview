library(wesanderson)
library(tidyverse)

# setwd("mfd_diversity")

metadata <- readxl::read_excel('../data/2025-04-14_mfd_db.xlsx') %>%
  select(mfd_sampletype:mfd_hab1)

sample.levels <- metadata %>%
  select(mfd_sampletype) %>%
  filter(!is.na(mfd_sampletype)) %>%
  distinct() %>%
  mutate(complex = mfd_sampletype) %>%
  arrange(mfd_sampletype) %>%
  pull(complex)

area.levels <- metadata %>%
  select(mfd_sampletype:mfd_areatype) %>%
  filter(!is.na(mfd_areatype)) %>%
  distinct() %>%
  mutate(complex = str_c(mfd_sampletype, mfd_areatype, sep = ", ")) %>%
  arrange(mfd_sampletype, mfd_areatype) %>%
  pull(complex)

mfdo1.levels <- metadata %>%
  select(mfd_sampletype:mfd_hab1) %>%
  filter(!is.na(mfd_hab1)) %>%
  # mutate(across(mfd_hab1, ~str_replace(., "Sclerophyllus scrub", "Temperate heath and scrub"))) %>%
  distinct() %>%
  mutate(complex = str_c(mfd_sampletype, mfd_areatype, mfd_hab1, sep = ", ")) %>%
  arrange(mfd_sampletype, mfd_areatype, mfd_hab1) %>%
  pull(complex)

rm(metadata)

## Ontology palettes
other.palette <- colorRampPalette(c(wes_palette("Royal1")[1], wes_palette("IsleofDogs2")[2]))
plot(rep(1, 6), col = other.palette(6), pch = 19, cex = 3)

sediment.palette <- colorRampPalette(c(wes_palette("IsleofDogs2")[3], wes_palette("FantasticFox1")[1]))
plot(rep(1, 5), col = sediment.palette(5), pch = 19, cex = 3)

soil.palette <- colorRampPalette(c(wes_palette("AsteroidCity1")[4], wes_palette("AsteroidCity1")[1]))
plot(rep(1, 15), col = soil.palette(16), pch = 19, cex = 3)

water.palette <- colorRampPalette(c(wes_palette("Darjeeling2")[2], wes_palette("Zissou1")[2]))
plot(rep(1, 6), col = water.palette(6), pch = 19, cex = 3)

## Picking colors
other.picks <- other.palette(6)
sediment.picks <- sediment.palette(9)
soil.picks <- soil.palette(21)
water.picks <- water.palette(9)

## Sampletype palette
sampletype.palette <- c(other.picks[1], sediment.picks[1], soil.picks[1], water.picks[1])
names(sampletype.palette) <- sample.levels

sampletype.palette
plot(rep(1, 4), col = sampletype.palette, pch = 19, cex = 3)

## Areatype palette
areatype.palette <- c(other.picks[2], sediment.picks[2:4], soil.picks[2:6], water.picks[2:4])
names(areatype.palette) <- area.levels

areatype.palette
plot(rep(1, 12), col = areatype.palette, pch = 19, cex = 3)

# MFDO1 palette
mfdo1.palette <- c(other.picks[3:6], sediment.picks[5:9], soil.picks[7:21], water.picks[5:9])
names(mfdo1.palette) <- mfdo1.levels

mfdo1.palette
plot(rep(1, 28), col = mfdo1.palette, pch = 19, cex = 3)









