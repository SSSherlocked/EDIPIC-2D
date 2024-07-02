cmake_minimum_required(VERSION 3.20)
project (EDIPIC-2D LANGUAGES C Fortran)

## set compiler
set(CMAKE_Fortran_COMPILER  mpifort)
set(CMAKE_C_COMPILER        mpicc)

file(GLOB src_f_files "src/*.f90")
file(GLOB src_c_files "src/*.c")

## set PETSc and HYPRE library directories
set(petsc_DIR       "/opt/petsc/petsc-3.21.3")
set(INCLUDE_DIRS    ${INCLUDE_DIRS}     "${petsc_DIR}/include")
set(LINK_DIRS       ${LINK_DIRS}        "${petsc_DIR}/lib")
set(LINK_LIBS       ${LINK_LIBS}        "petsc")
set(LINK_LIBS       ${LINK_LIBS}        "HYPRE")

## set MPICH library directories
#set(mpich_DIR       "/opt/mpich/mpich-4.2.1")
#set(INCLUDE_DIRS    ${INCLUDE_DIRS}     "${mpich_DIR}/include")
#set(LINK_DIRS       ${LINK_DIRS}        "${mpich_DIR}/lib")
#set(LINK_LIBS       ${LINK_LIBS}        "mpifort")

## compile the c library
add_library(RAND_C  STATIC      ${src_c_files})
set(LINK_LIBS       ${LINK_LIBS}        RAND_C)

## compile the fortran program
add_executable(${PROJECT_NAME}  ${src_f_files})

## link the libraries
target_include_directories  (${PROJECT_NAME} PUBLIC ${INCLUDE_DIRS})
target_link_directories     (${PROJECT_NAME} PUBLIC ${LINK_DIRS})
target_link_libraries       (${PROJECT_NAME} PUBLIC ${LINK_LIBS})