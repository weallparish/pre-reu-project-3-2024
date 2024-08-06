classdef InverseApproximation
    %INVERSEAPPROXIMATION Stores the approximation of the inverse of a
    %bounded function.
    %   Swaps the x and y variables of a function and plugs in points to
    %   approximate the inverse.

    properties
        xSpace; %points that will be approximated.
        ySpace; %approximated points.
    end

    methods
        function obj = InverseApproximation(func, lowBound, upBound, points)
            arguments
                func; %function that needs an inverse approximated.
                lowBound; %lower bound of approximation.
                upBound; %upper bound of approximation.
                points = 1000; %number of points to approximate.
            end

        %INVERSEAPPROXIMATION Construct an instance of this class
        %   Calculate and store the approximation of the inverse.
        
            syms x;
            f(x) = func;
            obj.xSpace = linspace(lowBound, upBound, points);
            obj.ySpace = f(obj.xSpace);
        end

        function approximation = InverseOf(obj, y)
            arguments
                obj 
                y %Point to take the inverse of. (What is x when f(x)=y?)
            end

        %INVERSEOF Finds the closest approximation to the inverse of a
        %given point.
        %   Performs a binary search on the approximation of the
        %   inverse and finds the nearest calculated inverse to the
        %   point.

            index = BinarySearch(obj.ySpace,y);
            approximation = obj.xSpace(index);
        end
    end
end