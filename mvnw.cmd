@echo off

:: Find the directory where this script is located
set SCRIPT_DIR=%~dp0

:: Set the MAVEN_PROJECTBASEDIR to the directory containing .mvn
if exist "%SCRIPT%.mvn" (
    set MAVEN_PROJECTBASEDIR=%SCRIPT_DIR%
) else (
    set MAVEN_PROJECTBASEDIR=%CD%
)

:: Set the wrapper JAR location
set WRAPPER_JAR="%MAVEN_PROJECTBASEDIR%\.mvn\wrapper\maven-wrapper.jar"

:: Download the wrapper JAR if it doesn't exist
if not exist %WRAPPER_JAR% (
    echo Downloading Maven Wrapper...
    if not exist "%MAVEN_PROJECTBASEDIR%\.mvn\wrapper" mkdir "%MAVEN_PROJECTBASEDIR%\.mvn\wrapper"
    powershell -Command "& { (New-Object Net.WebClient).DownloadFile('https://repo.maven.apache.org/maven2/io/takari/maven-wrapper/0.5.6/maven-wrapper-0.5.6.jar', '%WRAPPER_JAR%') }"
    if %ERRORLEVEL% NEQ 0 (
        echo Failed to download Maven Wrapper
        exit /b 1
    )
)

:: Set the Java executable
if "%JAVA_HOME%"=="" (
    echo JAVA_HOME environment variable is not set. Please set it to your JDK installation directory.
    exit /b 1
) else (
    set JAVA_EXEC="%JAVA_HOME%\bin\java.exe"
)

:: Execute Maven with the wrapper
%JAVA_EXEC% -Dmaven.multiModuleProjectDirectory=%MAVEN_PROJECTBASEDIR% -classpath %WRAPPER_JAR% org.apache.maven.wrapper.MavenWrapperMain %*

exit /b %ERRORLEVEL%
