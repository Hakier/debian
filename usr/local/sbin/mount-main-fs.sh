#!/bin/bash

mount $(df / | cut -d' ' -f1 | grep dev) /@

