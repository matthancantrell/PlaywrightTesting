FROM mcr.microsoft.com/playwright/dotnet:v1.42.0-jammy
FROM mono

WORKDIR /PlaywrightTests

ARG JENKINS_UID=1001
ARG JENKINS_GID=100
ARG JENKINS_USER=jenkins
ARG JENKINS_GROUP=users

# Create the jenkins user within this image
RUN if [ -z "$(grep "^$JENKINS_GROUP:" /etc/group)" ] ; then addgroup --group --gid $JENKINS_GID $JENKINS_GROUP ; fi
RUN adduser --system --uid $JENKINS_UID --ingroup $JENKINS_GROUP $JENKINS_USER
RUN chown -R $JENKINS_USER:$JENKINS_GROUP /home/$JENKINS_USER

# Install NUnit3 Console
ENV NUNIT_VERSION 3.10.0
RUN \
    nuget install NUnit.Runners -o /tmp/nunit -version $NUNIT_VERSION && \
    mkdir /nunit && \
    cp /tmp/nunit/NUnit.ConsoleRunner.$NUNIT_VERSION/tools/* /nunit && \
    cp /tmp/nunit/NUnit.Extension.NUnitProjectLoader.3.6.0/tools/* /nunit && \
    cp /tmp/nunit/NUnit.Extension.NUnitV2Driver.3.7.0/tools/* /nunit && \
    cp /tmp/nunit/NUnit.Extension.NUnitV2ResultWriter.3.6.0/tools/* /nunit && \
    cp /tmp/nunit/NUnit.Extension.TeamCityEventListener.1.0.6/tools/* /nunit && \
    cp /tmp/nunit/NUnit.Extension.VSProjectLoader.3.8.0/tools/* /nunit && \
    chown -R $JENKINS_USER:$JENKINS_GROUP /nunit && \
    chmod +x /nunit/nunit3-console.exe

COPY *.sln .
COPY *.csproj .
COPY Tests ./Tests
COPY TestResults ./TestResults

# RUN dotnet build
# RUN pwsh bin/Debug/net8.0/playwright.ps1 install --with-deps
# CMD ["dotnet", "test", "--logger:html"]