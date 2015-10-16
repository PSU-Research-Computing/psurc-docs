..  circe.rst
.. _circe:


*****
Circe
*****


+----------------------+------------------------+
|    Server Domain     |  ``circe.rc.pdx.edu``  |
+======================+========================+
| **Model**            |                        |
+----------------------+------------------------+
| **Ram**              | 189GB                  |
+----------------------+------------------------+
| **OS**               | CentOS 6.5             |
+----------------------+------------------------+
| **CPU**              | 2 x Intel Xeon E5-2665 |
+----------------------+------------------------+
| **Clock**            | 2.40 GHz               |
+----------------------+------------------------+
| **Cores**            | 16 (2 x 8)             |
+----------------------+------------------------+
| **Special Hardware** | NVIDIA GK110GL         |
|                      | [Tesla K20m] (rev a1)  |
+----------------------+------------------------+
| **HyperThreading**   | Disabled               |
+----------------------+------------------------+

.. _tesla:

Nvidia Tesla K20 GPGPU
======================

Circe is equipped with a `Tesla K20`_ `GPGPU`_.  A GPGPU, when utilized properly, can drastially improve the performance of certain types of computing jobs by incresasing computational concurrency.

Nvidia has a list of software that can take advantage of their GPGPUs:

- `Nvidia Software List <http://www.nvidia.com/object/gpu-applications.html?All>`_

Software that can use the GPGPU:

- `WRF <http://www2.mmm.ucar.edu/wrf/WG2/GPU/>`_
- `Gaussian G09 <http://on-demand-gtc.gputechconf.com/gtcnew/on-demand-gtc.php?searchByKeyword=roberto+gomperts&searchItems=&sessionTopic=&sessionEvent=&sessionYear=&sessionFormat=&submit=&select=+>`_
- `G-BLASTN <http://www.comp.hkbu.edu.hk/~chxw/software/G-BLASTN.html>`_
- `GPU-BLAST <http://archimedes.cheme.cmu.edu/?q=gpublast>`_

.. _GPGPU: https://en.wikipedia.org/wiki/General-purpose_computing_on_graphics_processing_units
.. _Tesla K20: http://www.nvidia.com/content/PDF/kepler/Tesla-K20-Passive-BD-06455-001-v07.pdf
