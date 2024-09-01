classdef Asin3Test < matlab.unittest.TestCase

    methods (Test)
        function firstQuadrantTest(testCase)
            % given
            x = 0.5;
            % when
            angleRad = asin3(x);
            % then
            expectedAngle = pi/6;
            testCase.verifyThat(angleRad,IsEqualTo(expectedAngle,"Within",AbsoluteTolerance(1e-12)));
        end

        function fourthQuadrantTest(testCase)
            % given
            x = -0.5;
            % when
            angleRad = asin3(x);
            % then
            expectedAngle = 11*pi/6;
            testCase.verifyThat(angleRad,IsEqualTo(expectedAngle,"Within",AbsoluteTolerance(1e-12)));
        end

        function negativeXWithModuleGreaterThanOne(testCase)
            % given
            x = -3;
            % when
            angleRad = asin3(x);
            % then
            expectedAngle = -1.570796326794897 + 1.762747174039086i;
            testCase.verifyThat(angleRad,IsEqualTo(expectedAngle,"Within",AbsoluteTolerance(1e-12)));
        end

        function positiveXWithModuleGreaterThanOne(testCase)
            % given
            x = 3;
            % when
            angleRad = asin3(x);
            % then
            expectedAngle = 1.570796326794897 - 1.762747174039086i;
            testCase.verifyThat(angleRad,IsEqualTo(expectedAngle,"Within",AbsoluteTolerance(1e-12)));
        end
    end

end

% "import" functions
function result = IsEqualTo(varargin)
result = matlab.unittest.constraints.IsEqualTo(varargin{:});
end
function result = AbsoluteTolerance(varargin)
result = matlab.unittest.constraints.AbsoluteTolerance(varargin{:});
end