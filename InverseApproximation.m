classdef InverseApproximation
    %UNTITLED4 Summary of this class goes here
    %   Detailed explanation goes here

    properties
        xSpace
        ySpace
    end

    methods
        function obj = InverseApproximation(func, lowBound, upBound)
            %UNTITLED4 Construct an instance of this class
            %   Detailed explanation goes here
            syms x;
            f(x) = func;
            obj.xSpace = linspace(lowBound, upBound, 1000);
            obj.ySpace = f(obj.xSpace);
        end

        function approximation = Inverse(obj, y)
            %METHOD1 Summary of this method goes here
            %   Detailed explanation goes here
            index = BinarySearch(obj.ySpace,y);
            approximation = obj.xSpace(index);
        end
    end
end