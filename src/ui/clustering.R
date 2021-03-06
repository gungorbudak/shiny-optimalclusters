clusteringOptionsUi <- verticalLayout(
    conditionalPanel(condition = "input.method == 'kmeans'",
        verticalLayout(
            h3("kmeans options"),
            flowLayout(
                numericInput("iter.max", "Maximum iterations", 100),
                numericInput("nstart", "Number of starts", 25),
                selectInput("algorithm", "Algorithm", choices = c("Hartigan-Wong", "Lloyd", "Forgy", "MacQueen"), selected = "Hartigan-Wong")
                ),
            a("Learn more about kmeans on RDocumentation.", href = "https://www.rdocumentation.org/packages/stats/versions/3.5.2/topics/kmeans", target = "_blank")
            )
        ),
    conditionalPanel(condition = "input.method == 'pam'",
        verticalLayout(
            h3("pam options"),
            flowLayout(
                selectInput("metric", "Metric", choices = c("euclidean", "manhattan"), selected = "euclidean"),
                selectInput("stand", "Standardize", choices = c(TRUE, FALSE), selected = FALSE),
                selectInput("do.swap", "Do swap", choices = c(TRUE, FALSE), selected = FALSE),
                selectInput("pamonce", "pamonce", choices = c(0, 1, 2), selected = 0)
                )
            ),
            a("Learn more about pam on RDocumentation.", href = "https://www.rdocumentation.org/packages/cluster/versions/2.0.7-1/topics/pam", target = "_blank")
        ),
    conditionalPanel(condition = "input.method == 'hcut'",
        verticalLayout(
            h3("hcut options"),
            flowLayout(
                selectInput("hc_func", "Function", choices = c("hclust", "agnes", "diana"), selected = "hclust"),
                selectInput("hc_method", "Method", choices = c("ward.D", "ward.D", "single", "complete", "average", "mcquitty", "median", "centroid"), selected = "complete"),
                selectInput("hc_metric", "Metric", choices = c("euclidean", "manhattan", "maximum", "canberra", "binary", "minkowski", "pearson", "spearman", "kendall"), selected = "hclust"),
                selectInput("stand", "Standardize", choices = c(TRUE, FALSE), selected = FALSE)
                ),
            a("Learn more about hcut on RDocumentation.", href = "https://www.rdocumentation.org/packages/factoextra/versions/1.0.5/topics/hcut", target = "_blank")
            )
        )
    )


clusteringUi <- verticalLayout(
  titlePanel("Clustering"),
  fixedRow(
    column(4,
      selectInput(
        "method",
        "Method",
        choices = c("K-Means" = "kmeans", "Partitioning Around Medoids" = "pam", "Hierarchical" = "hcut"),
        selected = "kmeans",
        width = "100%"
      )
    ),
    column(8,
      sliderInput(
        "range",
        "Number of clusters",
        min = 2,
        max = 100,
        value = c(2, 7),
        width = "100%"
      )
    )
  ),
  fixedRow(
    column(12, clusteringOptionsUi)
  ),
  hr(class="half-rule"),
  fixedRow(
    column(12, h3("Plots"), uiOutput("clusteringPlot"))
  )
)
