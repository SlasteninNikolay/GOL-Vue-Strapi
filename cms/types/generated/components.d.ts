import type { Schema, Struct } from '@strapi/strapi';

export interface ComponentsMember extends Struct.ComponentSchema {
  collectionName: 'components_components_members';
  info: {
    displayName: 'Member';
    icon: 'house';
  };
  attributes: {
    title: Schema.Attribute.String & Schema.Attribute.Required;
    type: Schema.Attribute.String & Schema.Attribute.Required;
    website: Schema.Attribute.String & Schema.Attribute.Required;
  };
}

export interface ComponentsProgram extends Struct.ComponentSchema {
  collectionName: 'components_components_programs';
  info: {
    displayName: 'Program';
    icon: 'gift';
  };
  attributes: {
    description: Schema.Attribute.Blocks & Schema.Attribute.Required;
    image: Schema.Attribute.Media<'images'> & Schema.Attribute.Required;
    subtitle: Schema.Attribute.String & Schema.Attribute.Required;
    title: Schema.Attribute.String & Schema.Attribute.Required;
  };
}

export interface FeaturesOsobennosti extends Struct.ComponentSchema {
  collectionName: 'components_features_osobennosti';
  info: {
    displayName: 'Features';
    icon: 'star';
  };
  attributes: {
    icon: Schema.Attribute.Media<'images' | 'files' | 'videos' | 'audios'>;
    title: Schema.Attribute.String & Schema.Attribute.Required;
  };
}

export interface MetaMeta extends Struct.ComponentSchema {
  collectionName: 'components_meta_metas';
  info: {
    displayName: 'meta';
    icon: 'code';
  };
  attributes: {
    Keywords: Schema.Attribute.String;
    Title: Schema.Attribute.String;
  };
}

declare module '@strapi/strapi' {
  export module Public {
    export interface ComponentSchemas {
      'components.member': ComponentsMember;
      'components.program': ComponentsProgram;
      'features.osobennosti': FeaturesOsobennosti;
      'meta.meta': MetaMeta;
    }
  }
}
