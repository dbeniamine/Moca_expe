# hpdc_expe

This repository provides all de dependencies to reproduce the experiments
presented in the article: "Moca: An Efficient Memory Trace Collection
System" submitted at HPDC'16.

## How-to

The experiment was run on grid5000 machines from
[Edel cluster](https://www.grid5000.fr/mediawiki/index.php/Grenoble:Hardware#Edel)
and [Idfreeze](http://digitalis.inria.fr/index.php/Idfreeze) machine from
digitalis.

Please note that the NAS_* experiment are very slow: it toolks 14h onn 8
machines for `NAS_edel`, and **TODO +72h** for `NAS_idfreeze`.

### If you have access to Grid5000 and Digitalis machines

To reproduce these experiemnts clone this repo then run `./init.sh`.
At this point you have everything you need to run the experiment, but you
still need to edit the files `Moca/test/perf_test_NAS_g5k.sh` and
`Moca/test/perf_test_param_g5k.sh` to update the `PREFIX` variable, it should
point to the root of this repository. You also need to set the `OWNER`
variable to your g5k username

Then you need to edit the file `jessie-nfs+gfortran.env` and put the correct
pat to `jessie.tgz` on line 10.

You can now deploy the image on one of Edel nodes and, as root, run
`~/Moca/test/perf_test_NAS_g5ksh` for the tool comparisons. Same thing on
Idfreeze (Digitalis).  For the parameter test run `sudo
~/Moca/test/perf_test_param_g5k.sh`  on an Edel machine.

### If you don't

First you need to install an environment similar to my g5k environment. It's a
Debian Jessie the file `pkg-list` contains the list of installed packages.

Then it is necessary to install
(DynInst-8.2.1)[http://www.dyninst.org/downloads/dyninst-8.x]

Once this is done, follow the same state as for g5k user and edit the line 16
of `Moca/test/perf_test_NAS_g5k.sh` to change the test on Idfreeze name.

Everything should work.
