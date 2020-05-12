/*
  $Header: /cvs/src/chrony/regress.h,v 1.13 2002/02/28 23:27:13 richard Exp $

  =======================================================================

  chronyd/chronyc - Programs for keeping computer clocks accurate.

 **********************************************************************
 * Copyright (C) Richard P. Curnow  1997-2002
 * 
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of version 2 of the GNU General Public License as
 * published by the Free Software Foundation.
 * 
 * This program is distributed in the hope that it will be useful, but
 * WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * General Public License for more details.
 * 
 * You should have received a copy of the GNU General Public License along
 * with this program; if not, write to the Free Software Foundation, Inc.,
 * 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA
 * 
 **********************************************************************

  =======================================================================

  Header file for regression routine(s)

  */

#ifndef GOT_REGRESS_H
#define GOT_REGRESS_H

extern void
RGR_WeightedRegression
(double *x,                     /* independent variable */
 double *y,                     /* measured data */
 double *w,                     /* weightings (large => data
                                   less reliable) */
 
 int n,                         /* number of data points */

 /* And now the results */

 double *b0,                    /* estimated y axis intercept */
 double *b1,                    /* estimated slope */
 double *s2,                    /* estimated variance (weighted) of
                                   data points */
 
 double *sb0,                   /* estimated standard deviation of
                                   intercept */
 double *sb1                    /* estimated standard deviation of
                                   slope */

 /* Could add correlation stuff later if required */
);

/* Return the weighting to apply to the standard deviation to get a
   given size of confidence interval assuming a T distribution */

extern double RGR_GetTCoef(int dof);

/* Return a status indicating whether there were enough points to
   carry out the regression */

extern int
RGR_FindBestRegression 
(double *x,                     /* independent variable */
 double *y,                     /* measured data */
 double *w,                     /* weightings (large => data
                                   less reliable) */
 
 int n,                         /* number of data points */

 /* And now the results */

 double *b0,                    /* estimated y axis intercept */
 double *b1,                    /* estimated slope */
 double *s2,                    /* estimated variance of data points */
 
 double *sb0,                   /* estimated standard deviation of
                                   intercept */
 double *sb1,                   /* estimated standard deviation of
                                   slope */

 int *new_start,                /* the new starting index to make the
                                   residuals pass the two tests */

 int *n_runs,                   /* number of runs amongst the residuals */

 int *dof                       /* degrees of freedom in statistics (needed
                                   to get confidence intervals later) */

);

int
RGR_FindBestRobustRegression
(double *x,
 double *y,
 int n,
 double tol,
 double *b0,
 double *b1,
 int *n_runs,
 int *best_start);

#endif /* GOT_REGRESS_H */
