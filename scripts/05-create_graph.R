#### Preamble ####
# Purpose: Creates and exports a DAG (Directed Acyclic Graph) illustrating causal relationships in the polls-of-polls model.
# Author: Shamayla Durrin
# Date: 30-10-2024
# Contact: shamayla.islam@mail.utoronto.ca
# License: MIT
# Pre-requisites: 00-install_packages.R
# Additional Notes: This chunk saves the DAG as a PNG file to the specified directory for use in the main report.

#### Workspace setup ####
library(DiagrammeR)
library(DiagrammeRsvg)
library(rsvg)
library(ggfortify)
library(here)

# Define the causal model
causal_model <- "digraph {
  # Define nodes
  node [shape = plaintext]
    A [label = 'Candidate Support']
    B [label = 'Pollster']
    C [label = 'Sample Size']
    D [label = 'State']
    E [label = 'Recency']
    F [label = 'Unobserved Confounders']

  # Define directed edges (causal relationships)
  edge []
    B -> A
    C -> A
    D -> A
    E -> A

  # Dashed edges for unobserved confounders
  edge [style = dashed]
    F -> B
    F -> E
    F -> A
}"

# Render and export the graph
graph <- grViz(causal_model)

# Save the graph as a PNG file
export_svg(graph) |>
  charToRaw() |>
  rsvg::rsvg_png("other/graphs/polls_of_polls_dag.png", width = 1000)

# Define the file paths using the here() function
output_path_model3 <-
  here("other", "graphs", "diagnostic_plot_model3.png")
output_path_model6 <-
  here("other", "graphs", "diagnostic_plot_model6.png")

# Save diagnostic plot for model3
png(output_path_model3, width = 800, height = 600)
autoplot(
  model3,
  label.size = 3,
  smooth.colour = "blue",
  smooth.linetype = "dashed"
) + theme_classic()
dev.off()

# Save diagnostic plot for model6
png(output_path_model6, width = 800, height = 600)
autoplot(
  model6,
  label.size = 3,
  smooth.colour = "blue",
  smooth.linetype = "dashed"
) + theme_classic()
dev.off()