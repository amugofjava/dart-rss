import 'package:dart_rss/util/helpers.dart';
import 'package:xml/xml.dart';

class DublinCore {
  final String? title;
  final String? description;
  final String? creator;
  final String? subject;
  final List<String> subjects;
  final String? publisher;
  final String? contributor;
  final String? date;
  final String? type;
  final String? format;
  final String? identifier;
  final String? source;
  final String? language;
  final String? relation;
  final String? coverage;
  final String? rights;

  const DublinCore({
    this.title,
    this.description,
    this.creator,
    this.subject,
    this.subjects = const <String>[],
    this.publisher,
    this.contributor,
    this.date,
    this.type,
    this.format,
    this.identifier,
    this.source,
    this.language,
    this.relation,
    this.coverage,
    this.rights,
  });

  factory DublinCore.parse(XmlElement element) {
    final subjects = findAllDirectElementsOrNull(element, 'dc:subject');
    return DublinCore(
      title: findElementOrNull(element, 'dc:title')?.text,
      description: findElementOrNull(element, 'dc:description')?.text,
      creator: findElementOrNull(element, 'dc:creator')?.text,
      subject: findElementOrNull(element, 'dc:subject')?.text,
      subjects: subjects == null
          ? <String>[]
          : subjects.map((subjectElement) => subjectElement.text).toList(),
      publisher: findElementOrNull(element, 'dc:publisher')?.text,
      contributor: findElementOrNull(element, 'dc:contributor')?.text,
      date: findElementOrNull(element, 'dc:date')?.text,
      type: findElementOrNull(element, 'dc:type')?.text,
      format: findElementOrNull(element, 'dc:format')?.text,
      identifier: findElementOrNull(element, 'dc:identifier')?.text,
      source: findElementOrNull(element, 'dc:source')?.text,
      language: findElementOrNull(element, 'dc:language')?.text,
      relation: findElementOrNull(element, 'dc:relation')?.text,
      coverage: findElementOrNull(element, 'dc:coverage')?.text,
      rights: findElementOrNull(element, 'dc:rights')?.text,
    );
  }
}
