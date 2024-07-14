cmake_minimum_required(VERSION 3.20)
project (EDIPIC-2D LANGUAGES C Fortran)

## set compiler
set(CMAKE_Fortran_COMPILER  mpifort)
set(CMAKE_C_COMPILER        mpicc)

## avoid the line length limit
set(CMAKE_Fortran_FLAGS     -ffree-line-length-none)

## DO NOT ignore the 'F90' files!
file(GLOB src_f_files "src/*90")
file(GLOB src_c_files "src/*.c")

set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/lib)
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${PROJECT_SOURCE_DIR}/bin)

## set PETSc and HYPRE library directories
set(petsc_DIR       $ENV{PETSC_DIR})
set(INCLUDE_DIRS    ${INCLUDE_DIRS}     "${petsc_DIR}/include")
set(LINK_DIRS       ${LINK_DIRS}        "${petsc_DIR}/lib")
set(LINK_LIBS       ${LINK_LIBS}        "petsc")
set(LINK_LIBS       ${LINK_LIBS}        "HYPRE")

## compile the c library
add_library(RAND_C  STATIC      ${src_c_files})
set(LINK_LIBS       ${LINK_LIBS}        RAND_C)

## compile the fortran program
add_executable(${PROJECT_NAME} ${src_f_files})

## link the libraries
target_include_directories  (${PROJECT_NAME} PUBLIC ${INCLUDE_DIRS})
target_link_directories     (${PROJECT_NAME} PUBLIC ${LINK_DIRS})
target_link_libraries       (${PROJECT_NAME} PUBLIC ${LINK_LIBS})
