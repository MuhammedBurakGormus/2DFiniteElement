# Rectangular Domain Analysis under Various Mechanical Loadings MATLAB Application

In this repository, there are two folders:
- Simple Version (includes the MATLAB Application and necessary files for the simple version of the project)
- Project Screenshots (includes the screenshots of the detailed MATLAB Application developed for the ME361 Finite Element Course project)

## Simple Version Folder
Under the Simple Version folder, you can find the MATLAB Application developed in order to analyze a rectangular domain under mechanical loadings. \
You need to download all the files and run the "Two_Dim_FEM_Mechanical_Loadings_exported.p" file. 

---

The developed MATLAB GUI consists of 3 parts: PreProcess, Process and PostProcess. 

1. PreProcess allows users to:
- Create a rectangular domain by taking the width and height values
- Decide the mesh density of the domain
- Choose a 2D Element type in order to mesh the domain: (for this version two types of elements, D2TR3N and D2QU4N)
- Decide how many Gauss Points to be used while calculating the stiffness matrix

 <img width="1438" alt="Ekran Resmi 2021-11-13 15 14 20" src="https://user-images.githubusercontent.com/77242876/141643575-860207bf-10e9-4f51-97f6-9396ced2bcfb.png">





2. Process allows users to:
- Choose a mechanical loadings type: Extension, Expansion and Shear
- Change the deformation magnitude
- Input material properties: Youngs's Modulus and Poisson Ratio 

<img width="1438" alt="Ekran Resmi 2021-11-13 16 11 19" src="https://user-images.githubusercontent.com/77242876/141645037-2501a31a-daf3-4a5f-ad8c-d5b3529d3830.png">


3. PostProcess allows users to analyze different interest of information such as
- Stress_xx, Stress_xy, Stress_yx, Stress_yy
- Strain_xx, Strain_xy, Strain_yx, Strain_yy
- Displacement in x and y direction

<img width="1440" alt="Ekran Resmi 2021-11-13 16 13 25" src="https://user-images.githubusercontent.com/77242876/141645082-9dac5240-e1aa-437f-8d30-92825fff46c7.png">


### Extra Features
- Show node numbers/element numbers Switch
- Show Node List and Element List Dropdown Menu
- Show Extended Node List and Global Stiffness Matrix Dropdown Menu
- (not)Display edges Switch
- Save Figure(s) Buttons
- ColorBar Change Availability under ColorBar Toggle Button
- Magnifier Slider that shows the exaggerated deformation
- Progress Lamp that helps the users

## First Screenshot from the Simple Version 
<img width="1440" alt="Ekran Resmi 2021-11-13 14 36 45" src="https://user-images.githubusercontent.com/77242876/141645227-8ccc0c02-ef45-4ed8-953f-d85ff0911ebb.png">

## Second Screenshot from the Simple Version
<img width="1439" alt="Ekran Resmi 2021-11-13 14 47 53" src="https://user-images.githubusercontent.com/77242876/141645244-94c3c365-592e-453b-8e0a-a439151ab8fb.png">


## Project ScreenShots

In this folder, you can find the screenshots of the application that is created for the ME361 Finite Element Method Course. \
The application, here, is the extended version of the Simple Version in terms of preprocessing. In this GUI, you can create geometries including a void or including another material in the void. \
The geometries include: 
- Rhombus Void | Rhombus Inclusion
- Circle Void  | Circle Inclusion
- Square Void  | Square Inclusion

The geometries can be meshed according to the users inputs similar to the Simple Version. 











