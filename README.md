buildroot-cross-rpm
===================

Install cross built RPM packages into a staging area to be imaged into a file system for the target

Project abandoned.  Go to Yocto / OpenEmbedded projects for a working cross RPM implementation.
This not a trivial process since it involves supporting an install process that can run on any of the targetat time of install or during the croos kickstart, which may need to run this in a 'cross' mode, and in some cases resort to use of run-once scripts during the first boot on the target.

Darcy Watkins

