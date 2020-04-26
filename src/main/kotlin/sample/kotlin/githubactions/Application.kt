package sample.kotlin.githubactions

import io.micronaut.runtime.Micronaut

object Application {

    @JvmStatic
    fun main(args: Array<String>) {
        Micronaut.build()
                .packages("kotlin.githubactions.sample")
                .mainClass(Application.javaClass)
                .start()
    }
}