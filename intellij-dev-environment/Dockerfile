FROM base-environment
MAINTAINER Julian Nonino <noninojulian@outlook.com>

# Create Developer user and add it to sudoers and create .m2 folder the user
RUN useradd -c "Developer User" -d /home/developer -m developer && \
    echo "developer ALL=NOPASSWD: ALL" >> /etc/sudoers && \
    mkdir /home/developer/.m2 && \
    mkdir /home/developer/.m2/repository

# Install IntelliJ IDEA
RUN mkdir /home/developer/.IdeaIC2016.2 && \
    mkdir /home/developer/.IdeaIC2016.2/config && \
    mkdir /home/developer/.IdeaIC2016.2/config/plugins && \
    chown -R developer:developer /home/developer/.IdeaIC2016.2 && \
    wget https://download-cf.jetbrains.com/idea/ideaIC-2016.2.4.tar.gz -O intellij.tar.gz -q && \
    mkdir /opt/intellij && \
    tar -zxf intellij.tar.gz --strip-components=1 -C /opt/intellij && \
    rm intellij.tar.gz

# Install Plugins
RUN echo 'Installing Docker Plugin' && \
    wget https://plugins.jetbrains.com/files/7724/27617/Docker-plugin.jar -O /home/developer/.IdeaIC2016.2/config/plugins/Docker-plugin.jar && \
    echo 'Installing IvyIDEA Plugin' && \
    wget https://plugins.jetbrains.com/files/3612/25973/IvyIDEA-1.0.14.zip -O IvyIDEA.zip && \
    unzip IvyIDEA.zip -d /home/developer/.IdeaIC2016.2/config/plugins/ && \
    rm IvyIDEA.zip && \
    echo 'Installing BashSupport Plugin' && \
    wget https://plugins.jetbrains.com/files/4230/28046/BashSupport-1.5.8.163.zip -O BashSupport.zip && \
    unzip BashSupport.zip -d /home/developer/.IdeaIC2016.2/config/plugins/ && \
    rm BashSupport.zip && \
    echo 'Installing Markdown Plugin' && \
    wget https://plugins.jetbrains.com/files/7793/25156/markdown-2016.1.20160405.zip -O markdown.zip -q && \
    unzip markdown.zip -d /home/developer/.IdeaIC2016.2/config/plugins/ && \
    rm markdown.zip && \
    wget https://plugins.jetbrains.com/files/631/27089/python-162.43.zip -O PythonPlugin.zip && \
    unzip PythonPlugin.zip -d /home/developer/.IdeaIC2016.2/config/plugins/ && \
    rm PythonPlugin.zip

# Give permissions to .m2 and IntelliJ IDEA settings folders
RUN chown -R developer:developer /home/developer && \
    chmod -R 777 /home/developer/.m2 && \
    chmod -R 777 /home/developer/.IdeaIC2016.2

# Switch to Developer user
USER developer
ENV HOME /home/developer
WORKDIR /home/developer

# Copying default Maven Settings
COPY settings.xml /home/developer/.m2/settings.xml

# Copy Java JDK settings
ADD ./jdk.table.xml /home/developer/.IdeaIC2016.2/config/options/jdk.table.xml
ADD ./jdk.table.xml /home/developer/.jdk.table.xml

# Open IntelliJ IDEA
ENTRYPOINT [ "/opt/intellij/bin/idea.sh" ]
