#include <pybind11/pybind11.h>
#include <pybind11/embed.h>
#include <pybind11/stl.h>
#include <vector>
#include <Python.h>  // Include the Python C API

#include "utils.hpp"

namespace py = pybind11;

void scatterPlot(const std::vector<double>& x, const std::vector<double>& y) {
    // Start the interpreter only if it's not already running
    if (!Py_IsInitialized()) {
        py::scoped_interpreter guard{};
    }

    py::module_ plt = py::module_::import("matplotlib.pyplot");
    py::object scatter = plt.attr("scatter");
    py::object plot = plt.attr("plot");

    // Find the minimum and maximum of x and y
    double min_val = std::min(*std::min_element(x.begin(), x.end()), *std::min_element(y.begin(), y.end()));
    double max_val = std::max(*std::max_element(x.begin(), x.end()), *std::max_element(y.begin(), y.end()));

    // Add the bisector line
    plot(py::make_tuple(min_val - 0.1, max_val + 0.1), py::make_tuple(min_val -  0.1, max_val + 0.1), "r--");

    // Plot the scatter plot
    scatter(x, y);

    // Set the limits of the x and y axes
    plt.attr("xlim")(py::make_tuple(min_val - 0.1, max_val + 0.1));
    plt.attr("ylim")(py::make_tuple(min_val - 0.1, max_val + 0.1));

    // Add labels and title
    plt.attr("xlabel")("Birth");
    plt.attr("ylabel")("Death");
    plt.attr("title")("DGM Plot");

    plt.attr("show")();
}