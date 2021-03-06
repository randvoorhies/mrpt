#!/bin/sh

MRPT_DIR=`pwd`
BUILD_DIR=build

CMAKE_C_FLAGS="-Wall -Wextra -Wabi -O2"
CMAKE_CXX_FLAGS="-Wall -Wextra -Wabi -O2"

function build ()
{
  mkdir $BUILD_DIR && cd $BUILD_DIR
  cmake $MRPT_DIR -DBUILD_APPLICATIONS=FALSE -DBUILD_TESTING=FALSE
  make -j2
}

function test ()
{
  mkdir $BUILD_DIR && cd $BUILD_DIR
  cmake $MRPT_DIR -DBUILD_APPLICATIONS=FALSE
  #make tests
  make run_tests_mrpt_base -j2
  make run_tests_mrpt_slam -j2
  make run_tests_mrpt_graphslam -j2
  make run_tests_mrpt_topography -j2
  make run_tests_mrpt_srba -j2
  make run_tests_mrpt_scanmatching -j2
  make run_tests_mrpt_opengl -j2
  make run_tests_mrpt_obs -j2
  make run_tests_mrpt_maps -j2
}

function testhwdrivers ()
{
  mkdir $BUILD_DIR && cd $BUILD_DIR
  cmake $MRPT_DIR -DBUILD_APPLICATIONS=FALSE 
  make run_tests_mrpt_hwdrivers
}

function doc ()
{
  echo doc placeholder
}

case $TASK in
  build ) build;;
  test ) test;;
  testhwdrivers ) testhwdrivers;;
  doc ) doc;;
esac
