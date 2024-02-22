#!/bin/bash
sed -i 's/HISTSIZE=1000/HISTSIZE=10000/g' /root/.bashrc
sed -i 's/HISTFILESIZE=2000/HISTFILESIZE=20000/g' /root/.bashrc