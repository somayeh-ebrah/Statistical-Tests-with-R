library( ggplot2 )
library( reshape )

stats <- list()

cohortNames <- c('OAI')
stats[[1]] <- read.csv( "./logJacobianMeasuresFold1.csv" )

jacobianRange <- c()
regularizationCohort <- c()
factorLevels <- c()

for( i in 1:length( cohortNames ) )
  {
  jacSyN5th <- stats[[i]]$X5th.[stats[[i]]$Regularization == 'syn']
  jacBSplineSyN5th <- stats[[i]]$X5th.[stats[[i]]$Regularization == 'bsyn']

  jacSyN95th <- stats[[i]]$X95th.[stats[[i]]$Regularization == 'syn']
  jacBSplineSyN95th <- stats[[i]]$X95th.[stats[[i]]$Regularization == 'bsyn']

  jacSyNRange <- jacSyN95th - jacSyN5th
  jacBSplineSyNRange <- jacBSplineSyN95th - jacBSplineSyN5th

  regCohort <- c( rep.int( paste0( "SyN\n(", cohortNames[i], ")" ), length( jacSyNRange ) ),
                  rep.int( paste0( "BSplineSyN\n(", cohortNames[i], ")" ), length( jacBSplineSyNRange ) ) )

  factorLevels <- append( factorLevels, c( paste0( "BSplineSyN\n(", cohortNames[i], ")" ), paste0( "SyN\n(", cohortNames[i], ")" ) ) )

  regularizationCohort <- append( regularizationCohort, regCohort )
  jacobianRange <- append( jacobianRange, c( jacSyNRange, jacBSplineSyNRange ) )
  }

plotData <- data.frame( Cohort = factor( regularizationCohort, levels = factorLevels ), Range = jacobianRange )

myPlot <- ggplot( plotData,  aes( x = Cohort, y = Range ) ) +
										geom_violin( aes( fill = Cohort ), alpha = 0.75 ) +
										scale_fill_manual( name = "",
										  values = c( "darkred", "navyblue", "darkred", "navyblue", "darkred", "navyblue", "darkred", "navyblue", "darkred", "navyblue" ),
										  labels = c( "BSplineSyN", "SyN" ) ) +
          geom_vline( xintercept = c( 2.5, 4.5, 6.5, 8.5 ), linetype = "longdash", alpha = 0.5 ) +
										scale_x_discrete( "" ) +
										scale_y_continuous( "Log Jacobian range (95th% - 5th%)" ) +
  								theme( legend.position = "none" )

ggsave( filename = "jacobianRange.pdf", plot = myPlot, width = 13, height = 5, units = 'in' )



