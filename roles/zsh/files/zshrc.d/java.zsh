function jdk8() {
    export JAVA_HOME=/usr/lib/jvm/java-8-openjdk/
    export PATH=$JAVA_HOME/bin:$PATH
}

function jdk11() {
    export JAVA_HOME=/usr/lib/jvm/java-11-openjdk/
    export PATH=$JAVA_HOME/bin:$PATH
}

function jdk13() {
    export JAVA_HOME=/usr/lib/jvm/java-13-openjdk/
    export PATH=$JAVA_HOME/bin:$PATH
}

function jdk14() {
    export JAVA_HOME=/usr/lib/jvm/java-14-openjdk/
    export PATH=$JAVA_HOME/bin:$PATH
}

function graal8() {
    export JAVA_HOME=/usr/lib/jvm/java-8-openjdk/
    export GRAALVM_HOME=/usr/lib/jvm/java-8-graalvm/
    export PATH=$GRAALVM_HOME/bin:$JAVA_HOME/bin:$PATH
}

function graal11() {
    export JAVA_HOME=/usr/lib/jvm/java-11-openjdk/
    export GRAALVM_HOME=/usr/lib/jvm/java-11-graalvm/
    export PATH=$GRAALVM_HOME/bin:$JAVA_HOME/bin:$PATH
}

# Default to JDK 14

jdk14