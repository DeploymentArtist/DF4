Here is a sample script to remove the Unattend.xml from the reference image, which is needed if you want to use SCVMM, or other VDI solutions with your MDT reference image.

Step-by-Step guide.

1. Create an application named Configure - Remove UnattendXML. 

2. Use the Configure - Remove UnattendXML folder as application source, and set command line to : cscript.exe Configure-RemoveUnattendXML.wsf

3. Edit your reference image task sequence 

4. In the State Restore / Imaging / Sysprep Only group, after the Execute Sysprep action, add the Configure - Remove UnattendXML

