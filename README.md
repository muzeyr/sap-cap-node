## Install CAP CLI

If you haven't installed the CAP CLI, you can install it using npm (Node Package Manager). Open your terminal and run the following command:

```code
npm install -g @sap/cds-dk
```

## Verify Installation

After installation, verify that the cds command is available:

```code
cds --version
```

If the command returns the version number, the installation was successful.

Tabii, aşağıda `cds build` komutunun amacı ve nasıl kullanıldığını açıklayan İngilizce bir README bölümü ekledim:

---

## Building the CAP Project with `cds build`

The `cds build` command is an essential part of the development workflow when working with the SAP Cloud Application Programming (CAP) model. It prepares your project for deployment by compiling CDS (Core Data Services) models and generating runtime artifacts.

### Purpose

The primary purposes of the `cds build` command are:

1. **Compilation of CDS Models**: It compiles your CDS models into SQL database schemas, OData services, and other necessary artifacts.
2. **Generation of Artifacts**: It generates deployment-ready artifacts that can be used by the runtime environment.
3. **Preparation for Deployment**: It prepares your project for deployment to various environments by creating all necessary files and configurations.

### Usage

To build your CAP project, follow these steps:

1. **Navigate to Your Project Directory**:

   Open your terminal and navigate to the root directory of your CAP project:

    ```bash
    cd path/to/your/project
    ```

2. **Run the `cds build` Command**:

   Execute the following command to build your project:

    ```bash
    cds build
    ```

   This command will trigger the build process, compiling your CDS models and generating the required artifacts.

### Verifying the Build

After running the `cds build` command, you can verify that the build was successful by checking the output directory (usually `gen/`). This directory should contain the generated SQL scripts, OData metadata files, and other artifacts.

## Install the Cloud Foundry CLI

Install the Cloud Foundry CLI using Homebrew:

```code
brew tap cloudfoundry/tap
brew install cf-cli
```

## Verify Installation

After installation, verify that the cf command is available by running:

```code
cf --version
```

This should display the version of the Cloud Foundry CLI if installed correctly.

Creating the HANA HDI-Shared Service Instance
Once the Cloud Foundry CLI is installed and accessible, create the HANA HDI-Shared service instance with the following steps:

Open your terminal.

Execute the following command:

```
cf create-service hana hdi-shared MyHana-dev01
```

To verify that the service instance has been created successfully, use the following command:

```
cf services
```

This command lists all the service instances in your space. Look for MyHana-dev01 in the output to ensure it is listed and the status is create succeeded.

### Binding the Service Instance

After creating the service instance, you need to bind it to your application to use it. Use the following command to bind the service instance to your application:

```
cf bind-service <your-app-name> MyHana-dev01
```

Replace <your-app-name> with the name of your application.

### Final Steps

After binding the service instance, restage your application to apply the changes:

```
cf restage <your-app-name>
```

Your application should now be able to interact with the HANA HDI-Shared service instance.
