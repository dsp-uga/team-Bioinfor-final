# Segmentation for nuclei images from different experimental methods


The project is the final project of the CSCI 8360 Data Science Practicum class offered in Spring 2018 at University of Georgia by Jin.

## Introduction
Identifying the cells’ nuclei is an important problem for two critical reasons: (a) it is the starting point for biomedical analyses because most of the cells contain a nucleus full of DNA that codes for genetic information in all organisms, and (b) the researcher can
understand biological processes reflected in the changes of nuclei. Along with the development of the imaging research, using images is a faster and cheaper way to automate nucleus detection. Automating nucleus detection will allow for more efficient drug testing, and possibly shortening the cycle for development of new drugs.

## Data
The dataset contains 670 training samples and 65 test samples. Files belonging to an image are contained in a folder with this ImageId. Within training samples folder are two subfolders. One is ‘images’, containing the image file, which were acquired under a variety of conditions and vary in the cell type, magnification, and imaging modality (brightfield vs. fluorescence). Another one is ‘masks’, which contains the segmented masks of each nucleus. Each mask contains one nucleus. Masks are not allowed to overlap.

## Getting Started
These instructions will get you a copy of the project up and running on your local machine for development and testing purposes.

### Hardware Specs
- CPU: Intel(R) Core(TM) i7-5960X CPU @ 3.00GHz
- RAM: 64 GB
- GPU: Nvidia GeForce GTX 1080 Ti

### Prerequisites
- [Python 2.7](https://www.python.org/download/releases/2.7/)
- [Caffe](http://caffe.berkeleyvision.org/installation.html)
- [Matlab](https://www.mathworks.com/downloads/)


## Data Processing
We first merged all masks into one image for each sample. After that, we cut the image into 32*32 in order to fit the model, and we labeled them as background, edge or nuclei based on the mask. Also, we made a duplicated for each piece and rotate 90 degrees.

## Training Model
We used AlexNet as the model to train the data at Caffe in cuda9.0 cudnn7.12. 

## Results
Our best IoU score is 0.79. We obtained a mean of the average precision in 5 folds is 0.76.  



## License
LGPL-3.0. See [LICENSE](https://github.com/dsp-uga/team-Bioinfor-final/blob/master/LICENSE) for details.

## References
https://github.com/choosehappy/public/tree/master/DL%20tutorial%20Code



