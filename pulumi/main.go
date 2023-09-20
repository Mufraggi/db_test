package main

import (
	"github.com/pulumi/pulumi-gcp/sdk/v6/go/gcp/sql"
	"github.com/pulumi/pulumi/sdk/v3/go/pulumi"
)

func main() {
	pulumi.Run(func(ctx *pulumi.Context) error {
		instance, err := sql.NewDatabaseInstance(ctx, "article-pg", &sql.DatabaseInstanceArgs{
			DatabaseVersion: pulumi.String("POSTGRES_15"),
			Region:          pulumi.String("europe-west9"),
			Settings: &sql.DatabaseInstanceSettingsArgs{
				Tier: pulumi.String("db-f1-micro"),
			},
			DeletionProtection: pulumi.Bool(false),
		})

		if err != nil {
			return err
		}
		_, err = sql.NewDatabase(ctx, "database", &sql.DatabaseArgs{
			Instance: instance.Name,
		})

		if err != nil {
			return err
		}
		return nil
	})
}
