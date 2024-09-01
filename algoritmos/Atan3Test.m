classdef Atan3Test < matlab.unittest.TestCase

    methods (Test)
        function firstQuadrantTest(testCase)
            % given
            y = 3;
            x = 4;
            % when
            angleRad = atan3(y,x);
            % then
            expectedAngle = atan2(3,4); % ~ 0.6435
            testCase.assertEqual(angleRad,expectedAngle);
        end

        function secondQuadrantTest(testCase)
            % given
            y = 1/2;
            x = -sqrt(3)/2;
            % when
            angleRad = atan3(y,x);
            % then
            expectedAngle = 5*pi/6;
            testCase.assertEqual(angleRad,expectedAngle);
        end

        function thirdQuadrantTest(testCase)
            % given
            y = -sqrt(3)/2;
            x = -1/2;
            % when
            angleRad = atan3(y,x);
            % then
            expectedAngle = 4*pi/3;
            testCase.assertEqual(angleRad,expectedAngle);
        end

        function fourthQuadrantTest(testCase)
            % given
            y = -sqrt(2)/2;
            x = sqrt(2)/2;
            % when
            angleRad = atan3(y,x);
            % then
            expectedAngle = 7*pi/4;
            testCase.assertEqual(angleRad,expectedAngle);
        end
    end

end